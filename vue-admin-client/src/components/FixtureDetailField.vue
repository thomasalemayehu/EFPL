<template>
  <div v-if="!dataLoaded">
    <Spinner />
  </div>
  <div v-else>
    <div id="main-fixture-detail-field">
      <PlayerStatModal
        :showModal="showModal"
        :playerId="currentPlayerId"
        :gameweek="showingGameWeek"
        :activeTeamId="activeTeamId"
        @scoreChanged="scoreChanged"
        @closeModal="closeStatsModal"
        v-if="showModal"
      />
      <div class="field">
        <!-- /////////////////////// GOALKEEPERS ///////////////////// -->
        <div
          id="goalkeepers"
          ref="goalkeepers"
          @dragenter.prevent
          @dragover="lockerPlayerDragOver($event, 'goalkeepers')"
          @drop="lockerPlayerDrop($event, 'goalkeepers')"
          v-if="
            this.fixtureDetailData.lineups[this.activeTeamId].goalkeepers
              .length !== 0
          "
        >
          <div
            @click="openStatsModal(playerId)"
            @touch="openStatsModal(playerId)"
            draggable="true"
            @dragstart="fieldPlayerDragStart($event, playerId, 'goalkeepers')"
            @dragend.prevent="
              this.divPlayerAtHover.classList.remove('field-player-hover-sub')
            "
            class="field-player"
            :key="playerId"
            v-for="playerId in this.fixtureDetailData.lineups[this.activeTeamId]
              .goalkeepers"
            :data-player-id="playerId"
            :data-player-position="
              this.players[this.activeTeamId][playerId].position.toLowerCase()
            "
          >
            <h1>🤷‍♂️</h1>
            <p>
              {{ this.players[this.activeTeamId][playerId].playerName }}
            </p>
            <h5>
              {{
                this.players[this.activeTeamId][playerId].position.toUpperCase()
              }}
            </h5>
          </div>
        </div>
        <div
          id="goalkeepers"
          ref="goalkeepers"
          @dragenter.prevent
          @dragover="lockerPlayerDragOver($event, 'goalkeepers')"
          @drop="lockerPlayerDrop($event, 'goalkeepers')"
          v-else
        >
          <div>
            <label>{{ $t("GK") }}</label>
          </div>
        </div>
        <!-- /////////////////////// GOALKEEPERS ///////////////////// -->

        <!-- /////////////////////// DEFENDERS ///////////////////// -->
        <div
          id="defenders"
          ref="defenders"
          @dragenter.prevent
          @dragover="lockerPlayerDragOver($event, 'defenders')"
          @drop="lockerPlayerDrop($event, 'defenders')"
          v-if="
            this.fixtureDetailData.lineups[this.activeTeamId].defenders
              .length !== 0
          "
        >
          <div
            @click="openStatsModal(playerId)"
            @touch="openStatsModal(playerId)"
            draggable="true"
            @dragstart="fieldPlayerDragStart($event, playerId, 'defenders')"
            @dragend.prevent="
              this.divPlayerAtHover.classList.remove('field-player-hover-sub')
            "
            class="field-player"
            :key="playerId"
            v-for="playerId in this.fixtureDetailData.lineups[this.activeTeamId]
              .defenders"
            :data-player-id="playerId"
            :data-player-position="
              this.players[this.activeTeamId][playerId].position.toLowerCase()
            "
          >
            <h1>🤷‍♂️</h1>
            <p>
              {{ this.players[this.activeTeamId][playerId].playerName }}
            </p>
            <h5>
              {{
                this.players[this.activeTeamId][playerId].position.toUpperCase()
              }}
            </h5>
          </div>
        </div>
        <div
          id="defenders"
          ref="defenders"
          @dragenter.prevent
          @dragover="lockerPlayerDragOver($event, 'defenders')"
          @drop="lockerPlayerDrop($event, 'defenders')"
          v-else
        >
          <div>
            <label>{{ $t("DEF") }}</label>
          </div>
        </div>
        <!-- /////////////////////// DEFENDERS ///////////////////// -->

        <!-- /////////////////////// MIDFIELDERS ///////////////////// -->
        <div
          id="midfielders"
          ref="midfielders"
          @dragenter.prevent
          @dragover="lockerPlayerDragOver($event, 'midfielders')"
          @drop="lockerPlayerDrop($event, 'midfielders')"
          v-if="
            this.fixtureDetailData.lineups[this.activeTeamId].midfielders
              .length !== 0
          "
        >
          <div
            @click="openStatsModal(playerId)"
            @touch="openStatsModal(playerId)"
            draggable="true"
            @dragstart="fieldPlayerDragStart($event, playerId, 'midfielders')"
            @dragend.prevent="
              this.divPlayerAtHover.classList.remove('field-player-hover-sub')
            "
            class="field-player"
            :key="playerId"
            v-for="playerId in this.fixtureDetailData.lineups[this.activeTeamId]
              .midfielders"
            :data-player-id="playerId"
            :data-player-position="
              this.players[this.activeTeamId][playerId].position.toLowerCase()
            "
          >
            <h1>🤷‍♂️</h1>
            <p>
              {{ this.players[this.activeTeamId][playerId].playerName }}
            </p>
            <h5>
              {{
                this.players[this.activeTeamId][playerId].position.toUpperCase()
              }}
            </h5>
          </div>
        </div>
        <div
          id="midfielders"
          ref="midfielders"
          @dragenter.prevent
          @dragover="lockerPlayerDragOver($event, 'midfielders')"
          @drop="lockerPlayerDrop($event, 'midfielders')"
          v-else
        >
          <div>
            <label>{{ $t("MID") }}</label>
          </div>
        </div>
        <!-- /////////////////////// MIDFIELDERS ///////////////////// -->

        <!-- /////////////////////// STRIKERS ///////////////////// -->
        <div
          id="strikers"
          ref="strikers"
          @dragenter.prevent
          @dragover="lockerPlayerDragOver($event, 'strikers')"
          @drop="lockerPlayerDrop($event, 'strikers')"
          v-if="
            this.fixtureDetailData.lineups[this.activeTeamId].strikers
              .length !== 0
          "
        >
          <div
            @click="openStatsModal(playerId)"
            @touch="openStatsModal(playerId)"
            draggable="true"
            @dragstart="fieldPlayerDragStart($event, playerId, 'strikers')"
            @dragend.prevent="
              this.divPlayerAtHover.classList.remove('field-player-hover-sub')
            "
            class="field-player"
            :key="playerId"
            v-for="playerId in this.fixtureDetailData.lineups[this.activeTeamId]
              .strikers"
            :data-player-id="playerId"
            :data-player-position="
              this.players[this.activeTeamId][playerId].position.toLowerCase()
            "
          >
            <h1>🤷‍♂️</h1>
            <p>
              {{ this.players[this.activeTeamId][playerId].playerName }}
            </p>
            <h5>
              {{
                this.players[this.activeTeamId][playerId].position.toUpperCase()
              }}
            </h5>
          </div>
        </div>
        <div
          id="strikers"
          ref="strikers"
          @dragenter.prevent
          @dragover="lockerPlayerDragOver($event, 'strikers')"
          @drop="lockerPlayerDrop($event, 'strikers')"
          v-else
        >
          <div>
            <label>{{ $t("ATT") }}</label>
          </div>
        </div>
        <!-- /////////////////////// STRIKERS ///////////////////// -->

        <!-- /////////////////////// BENCH ///////////////////// -->
        <div
          id="bench"
          ref="bench"
          @dragenter.prevent
          @dragover="lockerPlayerDragOver($event, 'bench')"
          @drop="lockerPlayerDrop($event, 'bench')"
          v-if="
            this.fixtureDetailData.lineups[this.activeTeamId].bench.length !== 0
          "
        >
          Subs📥📤
          <div
            draggable="true"
            @dragstart="fieldPlayerDragStart($event, playerId, 'bench')"
            @dragend.prevent="
              this.divPlayerAtHover.classList.remove('field-player-hover-sub')
            "
            class="field-player"
            :key="playerId"
            v-for="playerId in this.fixtureDetailData.lineups[this.activeTeamId]
              .bench"
            :data-player-id="playerId"
            :data-player-position="
              this.players[this.activeTeamId][playerId].position.toLowerCase()
            "
          >
            <h1>🤷‍♂️</h1>
            <p>
              {{ this.players[this.activeTeamId][playerId].playerName }}
            </p>
            <h5>
              {{
                this.players[this.activeTeamId][playerId].position.toUpperCase()
              }}
            </h5>
          </div>
        </div>
        <div
          id="bench"
          ref="bench"
          @dragenter.prevent
          @dragover="lockerPlayerDragOver($event, 'bench')"
          @drop="lockerPlayerDrop($event, 'bench')"
          v-else
        >
          <div>
            <label id="bench-label">{{ $t("SUBS") }}</label>
          </div>
        </div>
        <!-- /////////////////////// BENCH ///////////////////// -->
        <div class="actions">
          <button @click="saveLineup">{{ $t("Save") }}</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapFields } from "vuex-map-fields";
import { mapActions } from "vuex";
import PlayerStatModal from "../components/FixtureDetailPlayerStatModal.vue";
import Spinner from "../components/SpinnerComponent.vue";

export default {
  props: {
    activeTeamId: Number,
  },

  components: {
    PlayerStatModal,
    Spinner,
  },

  computed: {
    ...mapFields("Fixture", [
      "fixtureDetailsLoaded",
      "fixtureDetailData",
      "fixtureDetailId",
      "players",
      "locker",
      "showingGameWeek",
      "score",
    ]),

    dataLoaded() {
      return this.fixtureDetailsLoaded;
    },
  },

  data: () => ({
    showModal: false,
    currentPlayerId: "",
    divPlayerAtHover: null,
  }),

  methods: {
    ...mapActions("Fixture", [
      "setFixtureDetailDataLineup",
      "addPlayerToLocker",
      "deletePlayerFromLocker",
      "saveFixtureLineup",
      "setScore",
      "saveScore",
    ]),

    // Modal Handlers
    openStatsModal(playerId) {
      if (this.fixtureDetailData.status !== "scheduled") {
        this.currentPlayerId = playerId;
        this.showModal = true;
      } else {
        this.$store.dispatch("Global/setNotificationInfo", {
          showNotification: true,
          notificationType: "error",
          notificationMessage: "Can not update stats until the match starts.",
        });
      }
    },
    closeStatsModal() {
      this.showModal = false;
    },

    // Draggable Handlers
    fieldPlayerDragStart(e, playerId, playerPosition) {
      e.dataTransfer.effectAllowed = "move";
      e.dataTransfer.dropEffect = "move";
      e.dataTransfer.setData("player/Id", playerId);
      e.dataTransfer.setData("player/position", playerPosition);
      e.dataTransfer.setData("field/locker", "");

      // Data for subs between field and bench
      e.dataTransfer.setData("field/subs", "");
      e.dataTransfer.setData(
        `player/position/${this.players[this.activeTeamId][playerId].position}`,
        ""
      );

      if (playerPosition === "bench") {
        let destination = this.players[this.activeTeamId][playerId].position;
        destination = destination.toLowerCase();
        if (destination === "gk")
          e.dataTransfer.setData("position/goalkeepers", "");
        else if (destination === "def")
          e.dataTransfer.setData("position/defenders", "");
        else if (destination === "mid")
          e.dataTransfer.setData("position/midfielders", "");
        else if (destination === "att")
          e.dataTransfer.setData("position/strikers", "");
      } else e.dataTransfer.setData("position/bench", "");
    },

    // Droppable handlers
    lockerPlayerDragOver(e, fieldPosition) {
      const lineup = this.fixtureDetailData.lineups[this.activeTeamId];
      const noOfPlayers =
        lineup.goalkeepers.length +
        lineup.defenders.length +
        lineup.midfielders.length +
        lineup.strikers.length +
        lineup.bench.length;
      const noOfStarters =
        lineup.goalkeepers.length +
        lineup.defenders.length +
        lineup.midfielders.length +
        lineup.strikers.length;
      const goalkeeperExists = Boolean(lineup.goalkeepers.length);

      /* 

        * VALIDATION 1 : For Main Field
        VALIDATION 1.1: Allow drops only form locker to field
        VALIDATION 1.2: Limit players to their position only
        VALIDATION 1.3: Limit players per position to 6
        VALIDATION 1.4: Limit total no of players to 18
        VALIDATION 1.5: Limit no of starters to 11
        VALIDATION 1.6: Allow goalkeepers drop only if there is not a goalkeeper in place already

        * VALIDATION 2: For Bench
        VALIDATION 2.1: Apply this rule only for the bench position 
        VALIDATION 2.2: Allow drops only form locker to field
        VALIDATION 2.3: Limit players per position to 7
        VALIDATION 2.4: Limit total no of players to 18
      
      */

      if (
        e.dataTransfer.types.includes("locker/field") &&
        e.dataTransfer.types.includes(`position/${fieldPosition}`) &&
        this.fixtureDetailData.lineups[this.activeTeamId][fieldPosition]
          .length < 6 &&
        noOfPlayers < 18 &&
        noOfStarters < 11 &&
        !(
          goalkeeperExists &&
          e.dataTransfer.types.includes(`position/goalkeepers`)
        )
      )
        e.preventDefault();
      else if (
        fieldPosition === "bench" &&
        e.dataTransfer.types.includes("locker/field") &&
        this.fixtureDetailData.lineups[this.activeTeamId][fieldPosition]
          .length < 7 &&
        noOfPlayers < 18
      )
        e.preventDefault();
      // ** Validation for subs between bench and field
      else if (
        e.dataTransfer.types.includes("field/subs") &&
        e.dataTransfer.types.includes(`position/${fieldPosition}`) &&
        this.fixtureDetailData.lineups[this.activeTeamId][fieldPosition]
          .length <= 6 &&
        e.path[1].classList.contains("field-player")
      ) {
        const div = e.path[1];

        if (this.divPlayerAtHover)
          this.divPlayerAtHover.classList.remove("field-player-hover-sub");

        if (div.classList.contains("field-player")) {
          this.divPlayerAtHover = div;
          e.path[1].classList.add("field-player-hover-sub");
        }

        e.preventDefault();
      } else if (
        fieldPosition === "bench" &&
        e.dataTransfer.types.includes("field/subs") &&
        e.dataTransfer.types.includes(`position/${fieldPosition}`) &&
        this.fixtureDetailData.lineups[this.activeTeamId][fieldPosition]
          .length <= 7 &&
        e.path[1].classList.contains("field-player") &&
        e.dataTransfer.types.includes(
          `player/position/${e.path[1].dataset.playerPosition}`
        )
      ) {
        const div = e.path[1];

        if (this.divPlayerAtHover)
          this.divPlayerAtHover.classList.remove("field-player-hover-sub");

        if (div.classList.contains("field-player")) {
          this.divPlayerAtHover = div;
          e.path[1].classList.add("field-player-hover-sub");
        }

        e.preventDefault();
      }
    },
    lockerPlayerDrop(e, fieldPosition) {
      let playerId = e.dataTransfer.getData("player/Id");
      let playerPosition = e.dataTransfer.getData("player/position");
      e.dataTransfer.effectAllowed = "move";
      e.dataTransfer.dropEffect = "move";

      if (e.dataTransfer.types.includes("field/subs")) {
        const div = e.path[1];

        if (div.classList.contains("field-player")) {
          const player2Id = div.dataset.playerId;

          // Send the 2nd player to the 1st player's position
          this.setFixtureDetailDataLineup({
            operation: "remove",
            teamId: this.activeTeamId,
            incomingPlayer: player2Id,
            position: fieldPosition,
          });
          this.setFixtureDetailDataLineup({
            operation: "add",
            teamId: this.activeTeamId,
            incomingPlayer: player2Id,
            position: playerPosition,
          });

          // Send the 1st player to field position
          this.setFixtureDetailDataLineup({
            operation: "remove",
            teamId: this.activeTeamId,
            incomingPlayer: playerId,
            position: playerPosition,
          });
          this.setFixtureDetailDataLineup({
            operation: "add",
            teamId: this.activeTeamId,
            incomingPlayer: playerId,
            position: fieldPosition,
          });
        }
      } else {
        this.deletePlayerFromLocker({
          teamId: this.activeTeamId,
          playerId,
        });
        this.setFixtureDetailDataLineup({
          operation: "add",
          teamId: this.activeTeamId,
          incomingPlayer: playerId,
          position: fieldPosition,
        });
      }

      e.preventDefault();
    },

    // API Callers
    saveLineup() {
      // TODO: Check if there are 18 players
      this.saveFixtureLineup();
    },

    // Score Change Handler
    scoreChanged(e) {
      const matchId = this.fixtureDetailId;
      let newScore =
        this.$store.getters["Fixture/getScore"](matchId).split("v");
      let teamIndex = matchId.split("|").indexOf(String(this.activeTeamId));
      newScore[teamIndex] = String(e + parseInt(newScore[teamIndex]));
      newScore = `${newScore[0]}v${newScore[1]}`;
      this.setScore({ matchId, incomingScore: newScore });
      this.saveScore(this.fixtureDetailId);
    },
  },
};
</script>

<style scoped>
*::-webkit-scrollbar {
  display: none;
}

* {
  -ms-overflow-style: none; /* IE and Edge */
  scrollbar-width: none; /* Firefox */
}

h1,
h5,
p {
  margin: 0;
}

.field {
  display: flex;
  flex-direction: column;
  height: 80vh;
  overflow: hidden;
}

#main-fixture-detail-field {
  padding: 24px 0;
}

#goalkeepers,
#defenders,
#midfielders,
#strikers,
#bench {
  display: flex;
  flex-direction: row;
  flex-wrap: nowrap;
  overflow-x: auto;
  overflow-y: hidden;
  align-items: center;
  position: relative;
  height: 20%; /* Neccessary for the labels*/
  padding: 10px 0;
  /* border: 1px solid black; */
  background-color: var(--primary-900);
  text-align: center;
}

#goalkeepers div:first-child,
#defenders div:first-child,
#midfielders div:first-child,
#strikers div:first-child {
  margin-left: auto;
}

#goalkeepers div:last-child,
#defenders div:last-child,
#midfielders div:last-child,
#strikers div:last-child {
  margin-right: auto;
}

#goalkeepers {
  justify-content: center;
}

#bench {
  justify-content: flex-start;
  background-color: var(--neutral-200);
  padding: 5px;
}

#goalkeepers label,
#defenders label,
#midfielders label,
#strikers label,
#bench label {
  font-size: 6vh;
  letter-spacing: 25px;
  color: var(--neutral-200);
  opacity: 0.7;
  z-index: 0;
}

#bench label {
  /* left: 15vw; */
  position: absolute;
  color: var(--primary-900);
}

.field-player {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: var(--spacing-2xsmall);
  background-color: var(--neutral-100);
  color: var(--primary-color);
  border-radius: 2px;
  margin: 0 5px;
  z-index: 1;
  aspect-ratio: 4/3;
  overflow-wrap: break-word;
  height: 99px;
  width: 99px;
  box-shadow: 0 1px 2px var(--primary-500);
  font-size: var(--text-small);
  text-align: center;
}

.field-player-hover-sub {
  background-color: var(--secondary-300) !important;
}

.actions {
  align-self: center;
  margin: 10px 10px 0 10px;
}

.actions button {
  border: 0;
  width: 200px;
  height: 50px;
  color: var(--neutral-200);
  cursor: pointer;
  font-size: var(--text-base);
  background: var(--primary-900); /* Primary-900 */
  box-shadow: 0px 2px 0px #38bdf8;
  border-radius: 2px;
}

.actions button:hover {
  border: 0;
  width: 200px;
  height: 50px;
  color: var(--neutral-200);
  font-size: var(--text-base);
  background: var(--primary-800); /* Primary-200 */
  box-shadow: 0px 2px 0px #38bdf8;
  border-radius: 2px;
}

@media screen and (max-width: 480px) {
  img {
    height: 70px;
    width: 70px;
  }

  #bench-label {
    left: 22vw;
  }
}
@media screen and (min-width: 480px) and (max-width: 580px) {
  img {
    height: 90px;
    width: 90px;
  }

  #bench-label {
    left: 25vw;
  }
}
@media screen and (min-width: 580px) {
  img {
    height: 120px;
    width: 120px;
  }

  #bench-label {
    left: 33vw;
  }
}
@media screen and (min-width: 900px) {
  #main-fixture-detail-field {
    display: flex;
    flex-direction: row;
    justify-content: center;
    max-width: 600px;
  }

  .field {
    height: 95vh;
    width: 50vw;
  }

  #bench {
    height: 42% !important;
    display: grid;
    grid-template-columns: repeat(4, 109px);
    grid-template-rows: repeat(2, 103px);
    justify-content: center;
  }

  #bench-label {
    left: 15vw;
  }

  .actions {
    align-self: flex-end;
  }
}
@media screen and (min-width: 1400px) {
  img {
    height: 150px;
    width: 150px;
  }
}
</style>
