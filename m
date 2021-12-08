Return-Path: <virtio-comment-return-2444-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 44911986545
	for <virtio-comment@lists.oasis-open.org>; Wed,  8 Dec 2021 12:55:07 +0000 (UTC)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
From: =?utf-8?B?5L2V56OK?= <helei.sig11@bytedance.com>
In-Reply-To: <20211208023819-mutt-send-email-mst@kernel.org>
Date: Wed, 8 Dec 2021 20:54:28 +0800
Message-Id: <2BBFB71A-3F23-40BF-BF9E-9A62C6980829@bytedance.com>
References: <20211115074152.43427-1-helei.sig11@bytedance.com>
 <20211115074152.43427-2-helei.sig11@bytedance.com>
 <B6C7C34A-93D4-43BB-AEAC-FDE9A2AF687F@bytedance.com>
 <20211208023819-mutt-send-email-mst@kernel.org>
Subject: [virtio-comment] Re: [External] PING: [V2 PATCH 1/1] virtio-crypto: introduce akcipher
 service
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, xin.zeng@intel.com, arei.gonglei@huawei.com, pizhenwei@bytedance.com
List-ID: <virtio-comment.lists.oasis-open.org>



> On Dec 8, 2021, at 8:14 PM, Michael S. Tsirkin <mst@redhat.com> wrote:
>=20
> On Tue, Dec 07, 2021 at 08:10:40PM +0800, =E4=BD=95=E7=A3=8A wrote:
>> PING,  can anyone help review this patch?
>>=20
>>> On Nov 15, 2021, at 3:41 PM, Lei He <helei.sig11@bytedance.com> wrote:
>>>=20
>>> Introduce akcipher (asymmetric key cipher) service type, several
>>> asymmetric algorithms and relevent information:
>>> - RSA(padding algorithm, ASN.1 schema definition)
>>> - ECDSA(ECC algorithm)
>>>=20
>>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>>> Signed-off-by: Lei He <helei.sig11@bytedance.com>
>>> ---
>>> virtio-crypto.tex | 310 +++++++++++++++++++++++++++++++++++++++++++++++=
++++++-
>>> 1 file changed, 305 insertions(+), 5 deletions(-)
>>>=20
>>> diff --git a/virtio-crypto.tex b/virtio-crypto.tex
>>> index 74746f9..6f8ef08 100644
>>> --- a/virtio-crypto.tex
>>> +++ b/virtio-crypto.tex
>>> @@ -2,7 +2,7 @@ \section{Crypto Device}\label{sec:Device Types / Crypto=
 Device}
>>>=20
>>> The virtio crypto device is a virtual cryptography device as well as a
>>> virtual cryptographic accelerator. The virtio crypto device provides th=
e
>>> -following crypto services: CIPHER, MAC, HASH, and AEAD. Virtio crypto
>>> +following crypto services: CIPHER, MAC, HASH, AEAD and AKCIPHER. Virti=
o crypto
>>> devices have a single control queue and at least one data queue. Crypto
>>> operation requests are placed into a data queue, and serviced by the
>>> device. Some crypto operation requests are only valid in the context of=
 a
>>> @@ -39,9 +39,10 @@ \subsection{Feature bits}\label{sec:Device Types / C=
rypto Device / Feature bits}
>>>    supported by the MAC service.
>>> \item VIRTIO_CRYPTO_F_AEAD_STATELESS_MODE (4) stateless mode requests a=
re
>>>    supported by the AEAD service.
>>> +\item VIRTIO_CRYPTO_F_AKCIPHER_STATELESS_MODE (5) stateless mode reque=
sts are
>>> +    supported by the AKCIPHER service.
>>> \end{description}
>>>=20
>>> -
>>> \subsubsection{Feature bit requirements}\label{sec:Device Types / Crypt=
o Device / Feature bit requirements}
>>>=20
>>> Some crypto feature bits require other crypto feature bits
>>> @@ -52,6 +53,7 @@ \subsubsection{Feature bit requirements}\label{sec:De=
vice Types / Crypto Device
>>> \item[VIRTIO_CRYPTO_F_HASH_STATELESS_MODE] Requires VIRTIO_CRYPTO_F_REV=
ISION_1.
>>> \item[VIRTIO_CRYPTO_F_MAC_STATELESS_MODE] Requires VIRTIO_CRYPTO_F_REVI=
SION_1.
>>> \item[VIRTIO_CRYPTO_F_AEAD_STATELESS_MODE] Requires VIRTIO_CRYPTO_F_REV=
ISION_1.
>>> +\item[VIRTIO_CRYPTO_F_AKCIPHER_STATELESS_MODE] Requires VIRTIO_CRYPTO_=
F_REVISION_1.
>>> \end{description}
>>>=20
>>> \subsection{Supported crypto services}\label{sec:Device Types / Crypto =
Device / Supported crypto services}
>>> @@ -59,7 +61,7 @@ \subsection{Supported crypto services}\label{sec:Devi=
ce Types / Crypto Device /
>>> The following crypto services are defined:
>>>=20
>>> \begin{lstlisting}
>>> -/* CIPHER service */
>>> +/* CIPHER (Symmetric Key Cipher) service */
>>> #define VIRTIO_CRYPTO_SERVICE_CIPHER 0
>>> /* HASH service */
>>> #define VIRTIO_CRYPTO_SERVICE_HASH   1
>>> @@ -67,6 +69,8 @@ \subsection{Supported crypto services}\label{sec:Devi=
ce Types / Crypto Device /
>>> #define VIRTIO_CRYPTO_SERVICE_MAC    2
>>> /* AEAD (Authenticated Encryption with Associated Data) service */
>>> #define VIRTIO_CRYPTO_SERVICE_AEAD   3
>>> +/* AKCIPHER (Asymmetric Key Cipher) service */
>>> +#define VIRTIO_CRYPTO_SERVICE_AKCIPHER 4
>>> \end{lstlisting}
>>>=20
>>> The above constants designate bits used to indicate the which of crypto=
 services are
>>> @@ -181,6 +185,24 @@ \subsubsection{AEAD services}\label{sec:Device Typ=
es / Crypto Device / Supported
>>> operation requests, see \ref{sec:Device Types / Crypto Device / Device =
Operation / Control Virtqueue / Session operation}.
>>> \end{enumerate}
>>>=20
>>> +\subsubsection{AKCIPHER services}\label{sec: Device Types / Crypto Dev=
ice / Supported crypto services / AKCIPHER services}
>>> +
>>> +The following AKCIPHER algorithms are defined:
>>> +\begin{lstlisting}
>>> +#define VIRTIO_CRYPTO_NO_AKCIPHER 0
>>> +#define VIRTIO_CRYPTO_AKCIPHER_RSA   1
>>> +#define VIRTIO_CRYPTO_AKCIPHER_ECDSA 2
>>> +\end{lstlisting}
>>> +
>>> +The above constants have two usages:
>>> +\begin{enumerate}
>>> +\item As bit numbers, used to tell the driver which AKCIPHER algorithm=
s
>>> +are supported by the device, see \ref{sec:Device Types / Crypto Device=
 / Device configuration layout}.
>>> +\item As values, used to designate the algorithm in asymmetric crypto =
operation requests,
>>> +see \ref{sec:Device Types / Crypto Device / Device Operation / Control=
 Virtqueue / Session operation}.
>>> +\end{enumerate}
>>> +
>>> +
>>> \subsection{Device configuration layout}\label{sec:Device Types / Crypt=
o Device / Device configuration layout}
>>>=20
>>> Crypto device configuration uses the following layout structure:
>>> @@ -204,6 +226,7 @@ \subsection{Device configuration layout}\label{sec:=
Device Types / Crypto Device
>>>    le32 reserved;
>>>    /* Maximum size of each crypto request's content in bytes */
>>>    le64 max_size;
>>> +    le32 akcipher_algo;
>>> };
>>> \end{lstlisting}
>>>=20
>>> @@ -241,6 +264,7 @@ \subsection{Device configuration layout}\label{sec:=
Device Types / Crypto Device
>>>=20
>>> \item [\field{max_size}] is the maximum size of the variable-length par=
ameters of
>>>    data operation of each crypto request's content supported by the dev=
ice.
>>> +\item [\field{akcipher_algo}] AKCIPHER algorithms bit 0-31, see \ref{s=
ec: Device Types / Crypto Device / Supported crypto services / AKCIPHER ser=
vices}.
>>> \end{description}
>>>=20
>>> \begin{note}
>>> @@ -323,6 +347,7 @@ \subsubsection{Operation Status}\label{sec:Device T=
ypes / Crypto Device / Device
>>>    VIRTIO_CRYPTO_NOTSUPP =3D 3,
>>>    VIRTIO_CRYPTO_INVSESS =3D 4,
>>>    VIRTIO_CRYPTO_NOSPC =3D 5,
>>> +    VIRTIO_CRYPTO_KEY_REJECTED =3D 6,
>>>    VIRTIO_CRYPTO_MAX
>>> };
>>> \end{lstlisting}
>>> @@ -334,6 +359,7 @@ \subsubsection{Operation Status}\label{sec:Device T=
ypes / Crypto Device / Device
>>> \item VIRTIO_CRYPTO_INVSESS: invalid session ID when executing crypto o=
perations.
>>> \item VIRTIO_CRYPTO_NOSPC: no free session ID (only when the VIRTIO_CRY=
PTO_F_REVISION_1
>>>    feature bit is negotiated).
>>> +\item VIRTIO_CRYPTO_KEY_REJECTED: signature verification failed (only =
when AKCIPHER verification).
>>> \item VIRTIO_CRYPTO_ERR: any failure not mentioned above occurs.
>>> \end{itemize*}
>>>=20
>>> @@ -364,6 +390,10 @@ \subsubsection{Control Virtqueue}\label{sec:Device=
 Types / Crypto Device / Devic
>>>       VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AEAD, 0x02)
>>> #define VIRTIO_CRYPTO_AEAD_DESTROY_SESSION \
>>>       VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AEAD, 0x03)
>>> +#define VIRTIO_CRYPTO_AKCIPHER_CREATE_SESSION \
>>> +       VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x04)
>>> +#define VIRTIO_CRYPTO_AKCIPHER_DESTROY_SESSION \
>>> +       VIRTIO_CRYPTO_OPCDE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x05)
>>>    le32 opcode;
>>>    /* algo should be service-specific algorithms */
>>>    le32 algo;
>>> @@ -427,6 +457,11 @@ \subsubsection{Control Virtqueue}\label{sec:Device=
 Types / Crypto Device / Devic
>>>    VIRTIO_CRYPTO_F_REVISION_1 is negotiated and struct virtio_crypto_ae=
ad_create_session_flf is
>>>    padded to 56 bytes if NOT negotiated, and \field{op_vlf} is struct
>>>    virtio_crypto_aead_create_session_vlf.
>>> +\item If the opcode (in \field{header}) is VIRTIO_CRYPTO_AKCIPHER_CREA=
TE_SESSION
>>> +    then \field{op_flf} is struct virtio_crypto_akcipher_create_sessio=
n_flf if
>>> +    VIRTIO_CRYPTO_F_REVISION_1 is negotiated and struct virtio_crypto_=
akcipher_create_session_flf is
>>> +    padded to 56 bytes if NOT negotiated, and \field{op_vlf} is struct
>>> +    virtio_crypto_akcipher_create_session_vlf.
>>> \item If the opcode (in \field{header}) is VIRTIO_CRYPTO_CIPHER_DESTROY=
_SESSION
>>>    or VIRTIO_CRYPTO_HASH_DESTROY_SESSION or VIRTIO_CRYPTO_MAC_DESTROY_S=
ESSION or
>>>    VIRTIO_CRYPTO_AEAD_DESTROY_SESSION then \field{op_flf} is struct
>>> @@ -690,12 +725,129 @@ \subsubsection{Control Virtqueue}\label{sec:Devi=
ce Types / Crypto Device / Devic
>>> The length of \field{key} is specified in \field{key_len} in struct
>>> virtio_crypto_aead_create_session_flf.
>>>=20
>>> +\subparagraph{Session operation: AKCIPHER session}\label{sec:Device Ty=
pes / Crypto Device / Device
>>> +Operation / Control Virtqueue / Session operation / Session operation:=
 AKCIPHER session}
>>> +
>>> +Due to the complexity of asymmetric key algorithms, different algorith=
ms
>>> +require different parameters. The following data structures are used a=
s
>>> +supplementary parameters to describe the asymmetric algorithm sessions=
.
>>> +
>>> +For the RSA algorithm, the extra parameters are as follows:
>>> +\begin{lstlisting}
>>> +struct virtio_crypto_rsa_session_para {
>>> +#define VIRTIO_CRYPTO_RSA_RAW_PADDING   0
>>> +#define VIRTIO_CRYPTO_RSA_PKCS1_PADDING 1
>>> +    le32 padding_algo;
>>> +
>>> +#define VIRTIO_CRYPTO_RSA_NO_HASH   0
>>> +#define VIRTIO_CRYPTO_RSA_MD2       1
>>> +#define VIRTIO_CRYPTO_RSA_MD3       2
>>> +#define VIRTIO_CRYPTO_RSA_MD4       3
>>> +#define VIRTIO_CRYPTO_RSA_MD5       4
>>> +#define VIRTIO_CRYPTO_RSA_SHA1      5
>>> +#define VIRTIO_CRYPTO_RSA_SHA256    6
>>> +#define VIRTIO_CRYPTO_RSA_SHA384    7
>>> +#define VIRTIO_CRYPTO_RSA_SHA512    8
>>> +#define VIRTIO_CRYPTO_RSA_SHA224    9
>>> +    le32 hash_algo;
>>> +};
>>> +\end{lstlisting}
>>> +
>>> +If VIRTIO_CRYPTO_RSA_RAW_PADDING is specified, cipher/plain text SHOUL=
D be padded with zero,
>>> +VIRTIO_CRYPTO_RSA_RAW_PADDING is unsafe, and cannot be used for signin=
g and verification,
>>> +if any driver does this, the device SHOULD return error.
>>> +If VIRTIO_CRYPTO_RSA_PKCS1_PADDING is specified, EMSA-PKCS1-v1_5
>>> +(see \href{https://datatracker.ietf.org/doc/html/rfc8017#section-9.2}{=
rfc8017})
>>> +padding method is used, and \field{hash_algo} specifies the hash algor=
ithm corresponding
>>> +to the OID written in the padding bytes.
>>> +
>>> +The ECC algorithms such as the ECDSA algorithm, cannot use custom curv=
es, only the
>>> +following known curves can be used
>>> +(see \href{https://datatracker.ietf.org/doc/html/rfc5480}{NIST-recomme=
nded curves})
>>> +
>>> +\begin{lstlisting}
>>> +#define VIRTIO_CRYPTO_CURVE_UNKNOWN   0
>>> +#define VIRTIO_CRYPTO_CURVE_NIST_P192 1
>>> +#define VIRTIO_CRYPTO_CURVE_NIST_P224 2
>>> +#define VIRTIO_CRYPTO_CURVE_NIST_P256 3
>>> +#define VIRTIO_CRYPTO_CURVE_NIST_P384 4
>>> +#define VIRTIO_CRYPTO_CURVE_NIST_P521 5
>>> +\end{lstlisting}
>>> +
>>> +For the ECDSA algorithm, the extra parameters are as follows:
>>> +\begin{lstlisting}
>>> +struct virtio_crypto_ecdsa_session_para {
>>> +    /* See VIRTIO_CRYPTO_CURVE_* above */
>>> +    le32 curve_id;
>>> +};
>>> +\end{lstlisting}
>>> +
>>> +The fixed-length and the variable-length parameters of AKCIPHER sessio=
n requests are as follows:
>>> +\begin{lstlisting}
>>> +struct virtio_crypto_akcipher_create_session_flf {
>>> +    /* Device read only portion */
>>> +
>>> +    /* See VIRTIO_CRYPTO_AKCIPHER_* above */
>>> +    le32 algo;
>>> +#define VIRTIO_CRYPTO_AKCIPHER_KEY_TYPE_PUBLIC 1
>>> +#define VIRTIO_CRYPTO_AKCIPHER_KEY_TYPE_PRIVATE 2
>>> +    le32 key_type;
>>> +    /* length of key */
>>> +    le32 key_len;
>>> +    /* algothrim specific parameters described above */
>>> +    union {
>>> +        struct virtio_crypto_rsa_session_para rsa;
>>> +        struct virtio_crypto_ecdsa_session_para ecdsa;
>>> +    } u;
>>> +};
>=20
> What does the union mean here? The structures are different
> in size ... want to add padding? Or is it really just one
> of these structures, and the size can differ?
>=20
> We really also need to document the meaning of union in
> introduction.tex
>=20

It is really just one of these structures, I will modify here according to =
the previous style of the document to remove this =E2=80=9Cunion".

>=20
>=20
>>> +
>>> +struct virtio_crypto_akcipher_create_session_vlf {
>>> +    /* Device read only portion */
>>> +    u8 key[key_len];
>>> +};
>>> +\end{lstlisting}
>>> +
>>> +The length of \field{key} is specified in \field{key_len} in the struc=
t
>>> +virtio_crypto_akcipher_create_session_flf.
>>> +
>>> +If the key of an asymmetric algorithm contains multiple fields, for ex=
ample,
>>> +the RSA key pairs, they MUST be described using the
>>> +ASN.1 structure(see \href{https://www.itu.int/ITU-T/studygroups/com17/=
languages/X.680-0207.pdf}{Abstract Syntax Notation One(ASN.1)})
>>> +and MUST be DER(see \href{https://www.rfc-editor.org/rfc/rfc6025.txt}{=
Distinguished Encoding Rules}) encoded.
>>> +If the key of an asymmetric algorithm only contains an integer field, =
for example,
>>> +the ECDSA private key, then MUST be encoded with I2OSP primitives desc=
ribed in
>>> +\href{https://datatracker.ietf.org/doc/html/rfc3447}{rfc3447}.
>>> +
>>> +The schema of RSA keys is described with the RSAPrivateKey and RSAPubl=
icKey structure defined in
>>> +PKCS1 (see \href{https://datatracker.ietf.org/doc/html/rfc3447#appendi=
x-A.1.1}{rfc3447}).
>=20
> Please do not spread links to outside specs around like this.
> Add them in the normative references section.
>=20

My falut, I will correct it.

>=20
>>> +
>>> +\begin{lstlisting}
>>> +RsaPrivateKey ::=3D SEQUENCE {
>>> +    version          INTEGER
>>> +    modulus          INTEGER
>>> +    publicExponent   INTEGER
>>> +    privateExponent  INTEGER
>>> +    prime1           INTEGER
>>> +    prime2           INTEGER
>>> +    exponent1        INTEGER
>>> +    exponent1        INTEGER
>>> +    coefficient      INTEGER
>>> +}
>>> +
>>> +RsaPublicKey ::=3D SEQUENCE {
>>> +    modulus         INTEGER
>>> +    publicExponent  INTEGER
>>> +}
>>> +\end{lstlisting}
>>> +
>>> +The length of \field{key} is specified in \field{key_len} in
>>> +struct virtio_crypto_akcipher_create_session_flf.
>>>=20
>>> \drivernormative{\subparagraph}{Session operation: create session}{Devi=
ce Types / Crypto Device / Device
>>> Operation / Control Virtqueue / Session operation / Session operation: =
create session}
>>>=20
>>> \begin{itemize*}
>>> -\item The driver MUST set the \field{opcode} field based on service ty=
pe: CIPHER, HASH, MAC, or AEAD.
>>> +\item The driver MUST set the \field{opcode} field based on service ty=
pe: CIPHER, HASH, MAC, AEAD or AKCIPHER.
>>> \item The driver MUST set the control general header, the opcode specif=
ic header,
>>>    the opcode specific extra parameters and the opcode specific outcome=
 buffer in turn.
>>>    See \ref{sec:Device Types / Crypto Device / Device Operation / Contr=
ol Virtqueue}.
>>> @@ -726,7 +878,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device =
Types / Crypto Device / Devic
>>> Operation / Control Virtqueue / Session operation / Session operation: =
destroy session}
>>>=20
>>> \begin{itemize*}
>>> -\item The driver MUST set the \field{opcode} field based on service ty=
pe: CIPHER, HASH, MAC, or AEAD.
>>> +\item The driver MUST set the \field{opcode} field based on service ty=
pe: CIPHER, HASH, MAC, AEAD or AKCIPHER.
>>> \item The driver MUST set the \field{session_id} to a valid value assig=
ned by the device
>>>    when the session was created.
>>> \end{itemize*}
>>> @@ -764,6 +916,14 @@ \subsubsection{Data Virtqueue}\label{sec:Device Ty=
pes / Crypto Device / Device O
>>>    VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AEAD, 0x00)
>>> #define VIRTIO_CRYPTO_AEAD_DECRYPT \
>>>    VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AEAD, 0x01)
>>> +#define VIRTIO_CRYPTO_AKCIPHER_ENCRYPT \
>>> +    VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x00)
>>> +#define VIRTIO_CRYPTO_AKCIPHER_DECRYPT \
>>> +    VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x01)
>>> +#define VIRTIO_CRYPTO_AKCIPHER_SIGN \
>>> +    VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x02)
>>> +#define VIRTIO_CRYPTO_AKCIPHER_VERIFY \
>>> +    VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x03)
>>>    le32 opcode;
>>>    /* algo should be service-specific algorithms */
>>>    le32 algo;
>>> @@ -857,6 +1017,17 @@ \subsubsection{Data Virtqueue}\label{sec:Device T=
ypes / Crypto Device / Device O
>>>        and struct virtio_crypto_aead_data_flf is padded to 48 bytes if =
NOT negotiated,
>>>        and \field{op_vlf} is struct virtio_crypto_aead_data_vlf.
>>>    \end{itemize*}
>>> +\item If the opcode (in \field{header}) is VIRTIO_CRYPTO_AKCIPHER_ENCR=
YPT, VIRTIO_CRYPTO_AKCIPHER_DECRYPT,
>>> +    VIRTIO_CRYPTO_AKCIPHER_SIGN or VIRTIO_CRYPTO_AKCIPHER_VERIFY then:
>>> +    \begin{itemize*}
>>> +    \item If VIRTIO_CRYPTO_F_AKCIPHER_STATELESS_MODE is negotiated, \f=
ield{op_flf} is
>>> +        struct virtio_crypto_akcipher_data_flf_statless, and \field{op=
_vlf} is struct
>>> +        virtio_crypto_akcipher_data_vlf_stateless.
>>> +    \item If VIRTIO_CRYPTO_F_AKCIPHER_STATELESS_MODE is NOT negotiated=
, \field{op_flf}
>>> +        is struct virtio_crypto_akcipher_data_flf if VIRTIO_CRYPTO_F_R=
EVISION_1 is negotiated
>>> +        and struct virtio_crypto_akcipher_data_flf is padded to 48 byt=
es if NOT negotiated,
>>> +        and \field{op_vlf} is struct virtio_crypto_akcipher_data_vlf.
>>> +    \end{itemize*}
>>> \end{itemize*}
>>>=20
>>> \field{inhdr} is a unified input header that used to return the status =
of
>>> @@ -1533,3 +1704,132 @@ \subsubsection{AEAD Service Operation}\label{se=
c:Device Types / Crypto Device /
>>> \item VIRTIO_CRYPTO_ERR if any failure not mentioned above occurs.
>>> \end{itemize*}
>>> \end{itemize*}
>>> +
>>> +\subsubsection{AKCIPHER Service Operation}\label{sec:Device Types / Cr=
ypto Device / Device Operation / AKCIPHER Service Operation}
>>> +
>>> +Session mode AKCIPHER requests are as follows:
>>> +
>>> +\begin{lstlisting}
>>> +struct virtio_crypto_akcipher_data_flf {
>>> +    /* length of source data */
>>> +    le32 src_data_len;
>>> +    /* length of dst data */
>>> +    le32 dst_data_len;
>>> +};
>>> +
>>> +struct virtio_crypto_akcipher_data_vlf {
>>> +    /* Device read only portion */
>>> +    /* Source data */
>>> +    u8 src_data[src_data_len];
>>> +
>>> +    /* Device write only portion */
>>> +    /* Pointer to output data */
>>> +    u8 dst_data[dst_data_len];
>>> +};
>>> +\end{lstlisting}
>>> +
>>> +Each data request uses the virtio_crypto_akcipher_flf structure and th=
e virtio_crypto_akcipher_data_vlf
>>> +structure to store information used to run the AKCIPHER operations.
>>> +
>>> +For encryption, decryption, and signing:
>>> +\field{src_data} is the source data that will be processed, note that =
for signing operations,
>>> +src_data stores the data to be signed, which usually is the digest of =
some data rather than the
>>> +data itself.
>>> +\field{src_data_len} is the length of source data.
>>> +\field{dst_result} is the result data and \field{dst_data_len} is the =
length of it.
>>> +
>>> +For verification:
>>> +\field{src_data_len} refers to the length of the signature, and \field=
{dst_data_len} refers to
>>> +the length of signed data, where the signed data is usually the digest=
 of some data.
>>> +\field{src_data} is spliced by the signature and the signed data, the =
src_data with the lower
>>> +address stores the signature, and the higher address stores the signed=
 data.
>>> +\field{dst_data} is always empty for verification.
>>> +
>>> +Different algorithms have different signature formats.
>>> +For the RSA algorithm, the result is determined by the padding algorit=
hm specified by
>>> +\field{padding_algo} in structure virtio_crypto_rsa_session_para.
>>> +
>>> +For the ECDSA algorithm, the signature is composed of the following
>>> +ASN.1 structure(see \href{https://datatracker.ietf.org/doc/html/rfc327=
9#section-2.2.3}{rfc3279})
>>> +and MUST be DER encoded.
>>> +\begin{lstlisting}
>>> +Ecdsa-Sig-Value ::=3D SEQUENCE {
>>> +    r INTEGER,
>>> +    s INTEGER
>>> +}
>>> +\end{lstlisting}
>>> +
>>> +Stateless mode AKCIPHER service requests are as follows:
>>> +\begin{lstlisting}
>>> +struct virtio_crypto_akcipher_data_flf_stateless {
>>> +    struct {
>>> +        /* See VIRTIO_CYRPTO_AKCIPHER* above */
>>> +        le32 algo;
>>> +        /* See VIRTIO_CRYPTO_AKCIPHER_KEY_TYPE_* above */
>>> +        le32 key_type;
>>> +        /* length of key */
>>> +        le32 key_len;
>>> +
>>> +        /* algothrim specific parameters described above */
>>> +        union {
>>> +            struct virtio_crypto_rsa_session_para rsa;
>>> +            struct virtio_crypto_ecdsa_session_para ecdsa;
>>> +        } u;
>>> +    } sess_para;
>>> +
>>> +    /* length of source data */
>>> +    le32 src_data_len;
>>> +    /* length of destination data */
>>> +    le32 dst_data_len;
>>> +};
>>> +
>>> +struct virtio_crypto_akcipher_data_vlf_stateless {
>>> +    /* Device read only portion */
>>> +    u8 akcipher_key[key_len];
>>> +
>>> +    /* Source data */
>>> +    u8 src_data[src_data_len];
>>> +
>>> +    /* Device write only portion */
>>> +    u8 dst_data[dst_data_len];
>>> +};
>>> +\end{lstlisting}
>>> +
>>> +In stateless mode, the format of key and signature, the meaning of src=
_data and dst_data, are all the same
>>> +with session mode.
>>> +
>>> +\drivernormative{\paragraph}{AKCIPHER Service Operation}{Device Types =
/ Crypto Device / Device Operation / AKCIPHER Service Operation}
>>> +
>>> +\begin{itemize*}
>>> +\item If the driver uses the session mode, then the driver MUST set
>>> +    \field{session_id} in struct virtio_crypto_op_header to a valid
>>> +    value assigned by the device when the session was created.
>>> +\item If the VIRTIO_CRYPTO_F_AKCIPHER_STATELESS_MODE feature bit is ne=
gotiated, 1) if the
>>> +    driver uses the stateless mode, then the driver MUST set the \fiel=
d{flag} field in
>>> +    struct virtio_crypto_op_header to ZERO and MUST set the fields in =
struct
>>> +    virtio_crypto_akcipher_flf_stateless.sess_para, 2) if the driver u=
ses the session
>>> +    mode, then the driver MUST set the \field{flag} field in struct vi=
rtio_crypto_op_header
>>> +    to VIRTIO_CRYPTO_FLAG_SESSION_MODE.
>>> +\item The driver MUST set the \field{opcode} field in struct virtio_cr=
ypto_op_header
>>> +    to one of VIRTIO_CRYPTO_AKCIPHER_ENCRYPT, VIRTIO_CRYPTO_AKCIPHER_D=
ESTROY_SESSION,
>>> +    VIRTIO_CRYPTO_AKCIPHER_SIGN, and VIRTIO_CRYPTO_AKCIPHER_VERIFY.
>>> +\end{itemize*}
>>> +
>>> +\devicenormative{\paragraph}{AKCIPHER Service Operation}{Device Types =
/ Crypto Device / Device Operation / AKCIPHER Service Operation}
>>> +
>>> +\begin{itemize*}
>>> +\item If the VIRTIO_CRYPTO_F_AKCIPHER_STATELESS_MODE feature bit is ne=
gotiated, the
>>> +    device MUST parse the virtio_crypto_akcipher_data_vlf_stateless ba=
sed on the \field{opcode}
>>> +    field in general header.
>>> +\item The device MUST copy the result of cryptographic operation in th=
e dst_data[].
>>> +\item The device MUST set the \field{status} field in struct virtio_cr=
ypto_inhdr to
>>> +    one of the following values of enum VIRTIO_CRYPTO_STATUS:
>>> +\begin{itemize*}
>>> +\item VIRTIO_CRYPTO_OK if the operation success.
>>> +\item VIRTIO_CRYPTO_NOTSUPP if the requested algorithm or operation is=
 unsupported.
>>> +\item VIRTIO_CRYPTO_BADMSG if the verification result is incorrect.
>>> +\item VIRTIO_CRYPTO_INVSESS if the session ID invalid when in session =
mode.
>>> +\item VIRTIO_CRYPTO_KEY_REJECTED if the signature verification failed.
>>> +\item VIRTIO_CRYPTO_ERR if any failure not mentioned above occurs.
>>> +\end{itemize*}
>>> +\end{itemize*}
>>> --=20
>>> 2.11.0


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

