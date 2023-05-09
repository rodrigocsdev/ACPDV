unit acpdv.model.dao.interfaces;

interface

uses
  Data.DB,
  System.Generics.Collections;

type
  iDAO<T: Class> = interface
    function Listar: iDAO<T>;
    function ListarPorId(aId: Variant): iDAO<T>;
    function Excluir(aId: Variant): iDAO<T>; overload;
    function Excluir: iDAO<T>; overload;
    function Atualizar: iDAO<T>;
    function Inserir: iDAO<T>;
    function DataSource(var DataSource: TDataSource): iDAO<T>;
    function DataSet: TDataSet;
    function This: T;
    function These: TObjectList<T>;
  end;

implementation

end.
