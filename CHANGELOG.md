## [3.4.0] - LabeledContainerWidget

    - Adiciona o `LabeledContainerWidget` com exemplo

## [3.3.0] - Bordas do DateTimeFormField e DateRangeFormField

    - Adiciona enum `InputBorderType`
    - Torna borda de FormFields de data configuráveis. Usuário pode escolher entre NONE, UNDERLINE e OUTLINED

## [3.2.0] - DateTimeFormField e DateRangeFormField

    - Adiciona extensões `DateTimeExtension`, `DateTimeRangeExtension` e `IntExtension`.
    - Adiciona função `textoSeparado()`.
    - Adiciona Widgets de selecionar data e intervalo de datas, respectivamente:   `DatePicker` e `DateRangePicker`.
    - Adiciona FormFields que encapsulam `DatePicker` e `DateRangePicker`. Agora é possível usá-los com validação.

## [3.1.1] - BottomTabBar

    - Adiciona `EsigOptionBarWidget` e `EsigTabOptionWidget`

## [3.1.0] - Snackbar e ListOption

    - Snackbar com padding interno por padrão
    - ListOption com padding e margin configuráveis. Antes usava o valor padrão do EsigContainer

## [3.0.1] - Loading, Empty, Error

    - É possível alterar cor do texto dos widget de Loading, Empty e Error

## [3.0.0] - Refatoração geral

    - Corrije cor do indicador de carregamento no EsigLoadingWidget
    - Parâmetros obrigatórios são posicionais, ao invés de nomeados
    - Criar testes para `EsigContainerWidget`

## [2.3.1] - EsigSnackBar

    - Adiciona padding no Snackbar

## [2.2.1] - EsigSnackBar

    - Adiciona função para retornar ou apresentar `SnackBar`.
    - Refatora `EsigBottomSheetDialog` para que o cabeçalho seja fixo ao topo e não deslizável.
    - Adiciona mais parâmetros no `EsigDebugBottomSheet` para que seja mais personalizável.
    - No `EsigCustomDialog` há tratamento para qunado o texto do botão não é fornecido

## [2.2.0] - EsigBottomSheet

    - Adiciona `EsigBottomSheetDialog` e `EsigDebugBottomSheet`, ambos com exemplo em `example/lib/bottomsheet_dialog.dart`.
    - Refatora documentação de vários Widget

## [2.0.2] - EsigChip

    - Adiciona parâmetro padInterno no `EsigChipWidget`
    - Documenta `EsigChipWidget`
    - Atualiza exemplo para utilizar novo parâmetro

## [2.0.1] - EsigChip

    - Adiciona `EsigChipWidget` com exemplo
    - Adiciona parâmetros **altura** e **largura** nos `EsigLoadingWidget`, `EsigEmptyWidget` e `EsigErrorWidget`
    - Documenta `EsigTextButton` e `EsigContainerWidget`

## [2.0.0] - EsigListOptionWidget e EsigContainerWidget

    - Renomeia `EsigListOption` para `EsigListOptionWidget`
    - Adiciona o widget `EsigContainerWidget`, que serve de base para os containers usados nos app
    - Implementa novo `EsigListOptionWidget` usando o `EsigContainerWidget`
    - Adiciona exemplo de `EsigContainerWidget` em `example/lib/list_option.dart`

## [1.1.1] - EsigListOption e EsigDialogWidget

    - Adiciona o widget `EsigListOption()` com exemplo e documentação parcial
    - Corrige altura do `EsigDialogWidget` quando não há opções para mostrar e a orientação é configurada como Horizontal.

## [1.1.0] - Custom Dialog e RoundedAvatarWidget()

    - Filho dos botões do custom_dialog são Text() ao invés de String
    - Efeito de Splash dos botões do custom_dialog corrigidos
    - Adiciona `rounded_avatar_widget.dart` documentado e com exemplo(!)

## [1.0.1] - Implementa Dialog e botão

    - Adiciona `custom_dialog.dart`
    - Adiciona `botao_dialog.dart`
    - Documenta widgets adicionados na versão anterior
    - Adiciona projeto completo dentro da pasta `example/`, antes era apenas um arquivo

## [1.0.0] - Implementa versões iniciais

    - Adiciona `loading_widget.dart`
    - Adiciona `empty_widget.dart`
    - Adiciona `error_widget.dart`
    - Adiciona `loading_indicator_type.dart`
