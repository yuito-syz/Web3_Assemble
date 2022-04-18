<template>
    <v-form>
       <v-container>
         <v-row
           class="pt-7 pl-5 pr-5"
         >
           <v-text-field
             v-model="keyword"
             outlined
             rounded
             label="検索ワードを入力"
             append-outer-icon="mdi-magnify"
             @click:append-outer="search"
           >
           </v-text-field>
         </v-row>
       </v-container>
     </v-form>
</template>

<script>

export default {
    
}
</script>
