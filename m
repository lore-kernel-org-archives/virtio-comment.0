Return-Path: <virtio-comment-return-2499-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 006BF986254
	for <virtio-comment@lists.oasis-open.org>; Mon, 10 Jan 2022 12:20:41 +0000 (UTC)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
From: =?utf-8?B?5L2V56OK?= <helei.sig11@bytedance.com>
In-Reply-To: <20211210125329.72786-2-helei.sig11@bytedance.com>
Date: Mon, 10 Jan 2022 20:20:31 +0800
Message-Id: <90C9891E-5950-46AF-830F-2A2BB60CE5D0@bytedance.com>
References: <20211210125329.72786-1-helei.sig11@bytedance.com>
 <20211210125329.72786-2-helei.sig11@bytedance.com>
Subject: [virtio-comment] PING: [V3 PATCH 1/1] virtio-crypto: introduce akcipher service
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>, virtio-comment@lists.oasis-open.org
Cc: pizhenwei@bytedance.com, xin.zeng@intel.com, arei.gonglei@huawei.com
List-ID: <virtio-comment.lists.oasis-open.org>

Ping,  can someone help take a look at this patch? thanks.

> On Dec 10, 2021, at 8:53 PM, Lei He <helei.sig11@bytedance.com> wrote:
>=20
> Introduce akcipher (asymmetric key cipher) service type, several
> asymmetric algorithms and relevent information:
>  - RSA(padding algorithm, ASN.1 schema definition)
>  - ECDSA(ECC algorithm)
>=20
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> Signed-off-by: Lei He <helei.sig11@bytedance.com>
> ---
> introduction.tex  |  12 +++
> virtio-crypto.tex | 317 +++++++++++++++++++++++++++++++++++++++++++++++++=
++++-
> 2 files changed, 325 insertions(+), 4 deletions(-)
>=20
> diff --git a/introduction.tex b/introduction.tex
> index 6d52717..92a6911 100644
> --- a/introduction.tex
> +++ b/introduction.tex
> @@ -79,6 +79,18 @@ \section{Normative References}\label{sec:Normative Ref=
erences}
> =09\phantomsection\label{intro:SCMI}\textbf{[SCMI]} &
> =09Arm System Control and Management Interface, DEN0056,
> =09\newline\url{https://developer.arm.com/docs/den0056/c}, version C and =
any future revisions\\
> +=09\phantomsection\label{intro:rfc3447}\textbf{[RFC3447]} &
> +    J. Jonsson.,``Public-Key Cryptography Standards (PKCS) \#1: RSA Cryp=
tography'', February 2003.
> +=09\newline\url{https://www.ietf.org/rfc/rfc3447.txt}\\
> +=09\phantomsection\label{intro:NIST}\textbf{[FIPS186-3]} &
> +     National Institute of Standards and Technology (NIST), FIPS Publica=
tion 180-3: Secure Hash Standard, October 2008.
> +=09\newline\url{https://csrc.nist.gov/csrc/media/publications/fips/186/3=
/archive/2009-06-25/documents/fips_186-3.pdf}\\
> +    \phantomsection\label{intro:rfc6025}\textbf{[RFC6025]} &
> +    C.Wallace., ``ASN.1 Translation'', October 2010.
> +    \newline\url{https://www.ietf.org/rfc/rfc6025.txt}\\
> +    \phantomsection\label{intro:rfc3279}\textbf{[RFC3279]} &
> +    W.Polk., ``Algorithms and Identifiers for the Internet X.509 Public =
Key Infrastructure Certificate and Certificate Revocation List (CRL) Profil=
e'', April 2002.
> +    \newline\url{https://www.ietf.org/rfc/rfc3279.txt}\\
>=20
> \end{longtable}
>=20
> diff --git a/virtio-crypto.tex b/virtio-crypto.tex
> index 74746f9..256c144 100644
> --- a/virtio-crypto.tex
> +++ b/virtio-crypto.tex
> @@ -2,7 +2,7 @@ \section{Crypto Device}\label{sec:Device Types / Crypto D=
evice}
>=20
> The virtio crypto device is a virtual cryptography device as well as a
> virtual cryptographic accelerator. The virtio crypto device provides the
> -following crypto services: CIPHER, MAC, HASH, and AEAD. Virtio crypto
> +following crypto services: CIPHER, MAC, HASH, AEAD and AKCIPHER. Virtio =
crypto
> devices have a single control queue and at least one data queue. Crypto
> operation requests are placed into a data queue, and serviced by the
> device. Some crypto operation requests are only valid in the context of a
> @@ -39,6 +39,8 @@ \subsection{Feature bits}\label{sec:Device Types / Cryp=
to Device / Feature bits}
>     supported by the MAC service.
> \item VIRTIO_CRYPTO_F_AEAD_STATELESS_MODE (4) stateless mode requests are
>     supported by the AEAD service.
> +\item VIRTIO_CRYPTO_F_AKCIPHER_STATELESS_MODE (5) stateless mode request=
s are
> +    supported by the AKCIPHER service.
> \end{description}
>=20
>=20
> @@ -52,6 +54,7 @@ \subsubsection{Feature bit requirements}\label{sec:Devi=
ce Types / Crypto Device
> \item[VIRTIO_CRYPTO_F_HASH_STATELESS_MODE] Requires VIRTIO_CRYPTO_F_REVIS=
ION_1.
> \item[VIRTIO_CRYPTO_F_MAC_STATELESS_MODE] Requires VIRTIO_CRYPTO_F_REVISI=
ON_1.
> \item[VIRTIO_CRYPTO_F_AEAD_STATELESS_MODE] Requires VIRTIO_CRYPTO_F_REVIS=
ION_1.
> +\item[VIRTIO_CRYPTO_F_AKCIPHER_STATELESS_MODE] Requires VIRTIO_CRYPTO_F_=
REVISION_1.
> \end{description}
>=20
> \subsection{Supported crypto services}\label{sec:Device Types / Crypto De=
vice / Supported crypto services}
> @@ -59,7 +62,7 @@ \subsection{Supported crypto services}\label{sec:Device=
 Types / Crypto Device /
> The following crypto services are defined:
>=20
> \begin{lstlisting}
> -/* CIPHER service */
> +/* CIPHER (Symmetric Key Cipher) service */
> #define VIRTIO_CRYPTO_SERVICE_CIPHER 0
> /* HASH service */
> #define VIRTIO_CRYPTO_SERVICE_HASH   1
> @@ -67,6 +70,8 @@ \subsection{Supported crypto services}\label{sec:Device=
 Types / Crypto Device /
> #define VIRTIO_CRYPTO_SERVICE_MAC    2
> /* AEAD (Authenticated Encryption with Associated Data) service */
> #define VIRTIO_CRYPTO_SERVICE_AEAD   3
> +/* AKCIPHER (Asymmetric Key Cipher) service */
> +#define VIRTIO_CRYPTO_SERVICE_AKCIPHER 4
> \end{lstlisting}
>=20
> The above constants designate bits used to indicate the which of crypto s=
ervices are
> @@ -181,6 +186,24 @@ \subsubsection{AEAD services}\label{sec:Device Types=
 / Crypto Device / Supported
> operation requests, see \ref{sec:Device Types / Crypto Device / Device Op=
eration / Control Virtqueue / Session operation}.
> \end{enumerate}
>=20
> +\subsubsection{AKCIPHER services}\label{sec: Device Types / Crypto Devic=
e / Supported crypto services / AKCIPHER services}
> +
> +The following AKCIPHER algorithms are defined:
> +\begin{lstlisting}
> +#define VIRTIO_CRYPTO_NO_AKCIPHER 0
> +#define VIRTIO_CRYPTO_AKCIPHER_RSA   1
> +#define VIRTIO_CRYPTO_AKCIPHER_ECDSA 2
> +\end{lstlisting}
> +
> +The above constants have two usages:
> +\begin{enumerate}
> +\item As bit numbers, used to tell the driver which AKCIPHER algorithms
> +are supported by the device, see \ref{sec:Device Types / Crypto Device /=
 Device configuration layout}.
> +\item As values, used to designate the algorithm in asymmetric crypto op=
eration requests,
> +see \ref{sec:Device Types / Crypto Device / Device Operation / Control V=
irtqueue / Session operation}.
> +\end{enumerate}
> +
> +
> \subsection{Device configuration layout}\label{sec:Device Types / Crypto =
Device / Device configuration layout}
>=20
> Crypto device configuration uses the following layout structure:
> @@ -204,6 +227,7 @@ \subsection{Device configuration layout}\label{sec:De=
vice Types / Crypto Device
>     le32 reserved;
>     /* Maximum size of each crypto request's content in bytes */
>     le64 max_size;
> +    le32 akcipher_algo;
> };
> \end{lstlisting}
>=20
> @@ -241,6 +265,7 @@ \subsection{Device configuration layout}\label{sec:De=
vice Types / Crypto Device
>=20
> \item [\field{max_size}] is the maximum size of the variable-length param=
eters of
>     data operation of each crypto request's content supported by the devi=
ce.
> +\item [\field{akcipher_algo}] AKCIPHER algorithms bit 0-31, see \ref{sec=
: Device Types / Crypto Device / Supported crypto services / AKCIPHER servi=
ces}.
> \end{description}
>=20
> \begin{note}
> @@ -323,6 +348,7 @@ \subsubsection{Operation Status}\label{sec:Device Typ=
es / Crypto Device / Device
>     VIRTIO_CRYPTO_NOTSUPP =3D 3,
>     VIRTIO_CRYPTO_INVSESS =3D 4,
>     VIRTIO_CRYPTO_NOSPC =3D 5,
> +    VIRTIO_CRYPTO_KEY_REJECTED =3D 6,
>     VIRTIO_CRYPTO_MAX
> };
> \end{lstlisting}
> @@ -334,6 +360,7 @@ \subsubsection{Operation Status}\label{sec:Device Typ=
es / Crypto Device / Device
> \item VIRTIO_CRYPTO_INVSESS: invalid session ID when executing crypto ope=
rations.
> \item VIRTIO_CRYPTO_NOSPC: no free session ID (only when the VIRTIO_CRYPT=
O_F_REVISION_1
>     feature bit is negotiated).
> +\item VIRTIO_CRYPTO_KEY_REJECTED: signature verification failed (only wh=
en AKCIPHER verification).
> \item VIRTIO_CRYPTO_ERR: any failure not mentioned above occurs.
> \end{itemize*}
>=20
> @@ -364,6 +391,10 @@ \subsubsection{Control Virtqueue}\label{sec:Device T=
ypes / Crypto Device / Devic
>        VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AEAD, 0x02)
> #define VIRTIO_CRYPTO_AEAD_DESTROY_SESSION \
>        VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AEAD, 0x03)
> +#define VIRTIO_CRYPTO_AKCIPHER_CREATE_SESSION \
> +       VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x04)
> +#define VIRTIO_CRYPTO_AKCIPHER_DESTROY_SESSION \
> +       VIRTIO_CRYPTO_OPCDE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x05)
>     le32 opcode;
>     /* algo should be service-specific algorithms */
>     le32 algo;
> @@ -427,6 +458,11 @@ \subsubsection{Control Virtqueue}\label{sec:Device T=
ypes / Crypto Device / Devic
>     VIRTIO_CRYPTO_F_REVISION_1 is negotiated and struct virtio_crypto_aea=
d_create_session_flf is
>     padded to 56 bytes if NOT negotiated, and \field{op_vlf} is struct
>     virtio_crypto_aead_create_session_vlf.
> +\item If the opcode (in \field{header}) is VIRTIO_CRYPTO_AKCIPHER_CREATE=
_SESSION
> +    then \field{op_flf} is struct virtio_crypto_akcipher_create_session_=
flf if
> +    VIRTIO_CRYPTO_F_REVISION_1 is negotiated and struct virtio_crypto_ak=
cipher_create_session_flf is
> +    padded to 56 bytes if NOT negotiated, and \field{op_vlf} is struct
> +    virtio_crypto_akcipher_create_session_vlf.
> \item If the opcode (in \field{header}) is VIRTIO_CRYPTO_CIPHER_DESTROY_S=
ESSION
>     or VIRTIO_CRYPTO_HASH_DESTROY_SESSION or VIRTIO_CRYPTO_MAC_DESTROY_SE=
SSION or
>     VIRTIO_CRYPTO_AEAD_DESTROY_SESSION then \field{op_flf} is struct
> @@ -690,12 +726,137 @@ \subsubsection{Control Virtqueue}\label{sec:Device=
 Types / Crypto Device / Devic
> The length of \field{key} is specified in \field{key_len} in struct
> virtio_crypto_aead_create_session_flf.
>=20
> +\subparagraph{Session operation: AKCIPHER session}\label{sec:Device Type=
s / Crypto Device / Device
> +Operation / Control Virtqueue / Session operation / Session operation: A=
KCIPHER session}
> +
> +Due to the complexity of asymmetric key algorithms, different algorithms
> +require different parameters. The following data structures are used as
> +supplementary parameters to describe the asymmetric algorithm sessions.
> +
> +For the RSA algorithm, the extra parameters are as follows:
> +\begin{lstlisting}
> +struct virtio_crypto_rsa_session_para {
> +#define VIRTIO_CRYPTO_RSA_RAW_PADDING   0
> +#define VIRTIO_CRYPTO_RSA_PKCS1_PADDING 1
> +    le32 padding_algo;
> +
> +#define VIRTIO_CRYPTO_RSA_NO_HASH   0
> +#define VIRTIO_CRYPTO_RSA_MD2       1
> +#define VIRTIO_CRYPTO_RSA_MD3       2
> +#define VIRTIO_CRYPTO_RSA_MD4       3
> +#define VIRTIO_CRYPTO_RSA_MD5       4
> +#define VIRTIO_CRYPTO_RSA_SHA1      5
> +#define VIRTIO_CRYPTO_RSA_SHA256    6
> +#define VIRTIO_CRYPTO_RSA_SHA384    7
> +#define VIRTIO_CRYPTO_RSA_SHA512    8
> +#define VIRTIO_CRYPTO_RSA_SHA224    9
> +    le32 hash_algo;
> +};
> +\end{lstlisting}
> +
> +\field{padding_algo} specifies the padding method used by RSA sessions.
> +\begin{itemize*}
> +\item If VIRTIO_CRYPTO_RSA_RAW_PADDING is specified, 1) \field{hash_algo=
}
> +is ignored, 2) ciphertext and plaintext MUST be padded with leading zero=
s,
> +3) and RSA sessions with VIRTIO_CRYPTO_RSA_RAW_PADDING MUST not be used
> +for verification and signing operations.
> +\item If VIRTIO_CRYPTO_RSA_PKCS1_PADDING is specified, EMSA-PKCS1-v1_5 p=
adding method
> +is used(see \hyperref[intro:rfc3447]{PKCS\#1}), \field{hash_algo} specif=
ies how the
> +digest of the data passed to RSA sessions is calculated when verifying a=
nd signing.
> +It only affects the padding algorithm and is ignored during encryption a=
nd decryption.
> +\end{itemize*}
> +
> +The ECC algorithms such as the ECDSA algorithm, cannot use custom curves=
, only the
> +following known curves can be used(see \hyperref[intro:NIST]{NIST-recomm=
ended curves})
> +
> +\begin{lstlisting}
> +#define VIRTIO_CRYPTO_CURVE_UNKNOWN   0
> +#define VIRTIO_CRYPTO_CURVE_NIST_P192 1
> +#define VIRTIO_CRYPTO_CURVE_NIST_P224 2
> +#define VIRTIO_CRYPTO_CURVE_NIST_P256 3
> +#define VIRTIO_CRYPTO_CURVE_NIST_P384 4
> +#define VIRTIO_CRYPTO_CURVE_NIST_P521 5
> +\end{lstlisting}
> +
> +For the ECDSA algorithm, the extra parameters are as follows:
> +\begin{lstlisting}
> +struct virtio_crypto_ecdsa_session_para {
> +    /* See VIRTIO_CRYPTO_CURVE_* above */
> +    le32 curve_id;
> +};
> +\end{lstlisting}
> +
> +The fixed-length and the variable-length parameters of AKCIPHER session =
requests are as follows:
> +\begin{lstlisting}
> +struct virtio_crypto_akcipher_create_session_flf {
> +    /* Device read only portion */
> +
> +    /* See VIRTIO_CRYPTO_AKCIPHER_* above */
> +    le32 algo;
> +#define VIRTIO_CRYPTO_AKCIPHER_KEY_TYPE_PUBLIC 1
> +#define VIRTIO_CRYPTO_AKCIPHER_KEY_TYPE_PRIVATE 2
> +    le32 key_type;
> +    /* length of key */
> +    le32 key_len;
> +
> +#define VIRTIO_CRYPTO_AKCIPHER_SESS_ALGO_SPEC_HDR_SIZE 44
> +    u8 algo_flf[VIRTIO_CRYPTO_AKCIPHER_SESS_ALGO_SPEC_HDR_SIZE];
> +};
> +
> +struct virtio_crypto_akcipher_create_session_vlf {
> +    /* Device read only portion */
> +    u8 key[key_len];
> +};
> +\end{lstlisting}
> +
> +\field{algo} decides the type used by \field{algo_flf}.
> +\field{algo_flf} is fixed to 44 bytes and MUST contains of be one the
> +following structures:
> +\begin{itemize*}
> +\item struct virtio_crypto_rsa_session_para
> +\item struct virtio_crypto_ecdsa_session_para
> +\end{itemize*}
> +
> +The length of \field{key} is specified in \field{key_len} in the struct
> +virtio_crypto_akcipher_create_session_flf.
> +
> +If the key of an asymmetric algorithm contains multiple fields, for exam=
ple,
> +the RSA key pairs, they MUST be described using the
> +ASN.1 structure and MUST be DER encoded (see \hyperref[intro:rfc6025]{rf=
c6025}).
> +If the key of an asymmetric algorithm only contains an integer field, fo=
r example,
> +the ECDSA private key, then MUST be encoded with I2OSP primitives descri=
bed in
> +\hyperref[intro:rfc3447]{PKCS\#1}.
> +
> +The schema of RSA keys is described with the RSAPrivateKey and RSAPublic=
Key structure defined in
> +\hyperref[intro:rfc3447]{PKCS\#1}.
> +
> +\begin{lstlisting}
> +RsaPrivateKey ::=3D SEQUENCE {
> +    version          INTEGER
> +    modulus          INTEGER
> +    publicExponent   INTEGER
> +    privateExponent  INTEGER
> +    prime1           INTEGER
> +    prime2           INTEGER
> +    exponent1        INTEGER
> +    exponent1        INTEGER
> +    coefficient      INTEGER
> +}
> +
> +RsaPublicKey ::=3D SEQUENCE {
> +    modulus         INTEGER
> +    publicExponent  INTEGER
> +}
> +\end{lstlisting}
> +
> +The length of \field{key} is specified in \field{key_len} in
> +struct virtio_crypto_akcipher_create_session_flf.
>=20
> \drivernormative{\subparagraph}{Session operation: create session}{Device=
 Types / Crypto Device / Device
> Operation / Control Virtqueue / Session operation / Session operation: cr=
eate session}
>=20
> \begin{itemize*}
> -\item The driver MUST set the \field{opcode} field based on service type=
: CIPHER, HASH, MAC, or AEAD.
> +\item The driver MUST set the \field{opcode} field based on service type=
: CIPHER, HASH, MAC, AEAD or AKCIPHER.
> \item The driver MUST set the control general header, the opcode specific=
 header,
>     the opcode specific extra parameters and the opcode specific outcome =
buffer in turn.
>     See \ref{sec:Device Types / Crypto Device / Device Operation / Contro=
l Virtqueue}.
> @@ -726,7 +887,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Ty=
pes / Crypto Device / Devic
> Operation / Control Virtqueue / Session operation / Session operation: de=
stroy session}
>=20
> \begin{itemize*}
> -\item The driver MUST set the \field{opcode} field based on service type=
: CIPHER, HASH, MAC, or AEAD.
> +\item The driver MUST set the \field{opcode} field based on service type=
: CIPHER, HASH, MAC, AEAD or AKCIPHER.
> \item The driver MUST set the \field{session_id} to a valid value assigne=
d by the device
>     when the session was created.
> \end{itemize*}
> @@ -764,6 +925,14 @@ \subsubsection{Data Virtqueue}\label{sec:Device Type=
s / Crypto Device / Device O
>     VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AEAD, 0x00)
> #define VIRTIO_CRYPTO_AEAD_DECRYPT \
>     VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AEAD, 0x01)
> +#define VIRTIO_CRYPTO_AKCIPHER_ENCRYPT \
> +    VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x00)
> +#define VIRTIO_CRYPTO_AKCIPHER_DECRYPT \
> +    VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x01)
> +#define VIRTIO_CRYPTO_AKCIPHER_SIGN \
> +    VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x02)
> +#define VIRTIO_CRYPTO_AKCIPHER_VERIFY \
> +    VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x03)
>     le32 opcode;
>     /* algo should be service-specific algorithms */
>     le32 algo;
> @@ -857,6 +1026,17 @@ \subsubsection{Data Virtqueue}\label{sec:Device Typ=
es / Crypto Device / Device O
>         and struct virtio_crypto_aead_data_flf is padded to 48 bytes if N=
OT negotiated,
>         and \field{op_vlf} is struct virtio_crypto_aead_data_vlf.
>     \end{itemize*}
> +\item If the opcode (in \field{header}) is VIRTIO_CRYPTO_AKCIPHER_ENCRYP=
T, VIRTIO_CRYPTO_AKCIPHER_DECRYPT,
> +    VIRTIO_CRYPTO_AKCIPHER_SIGN or VIRTIO_CRYPTO_AKCIPHER_VERIFY then:
> +    \begin{itemize*}
> +    \item If VIRTIO_CRYPTO_F_AKCIPHER_STATELESS_MODE is negotiated, \fie=
ld{op_flf} is
> +        struct virtio_crypto_akcipher_data_flf_statless, and \field{op_v=
lf} is struct
> +        virtio_crypto_akcipher_data_vlf_stateless.
> +    \item If VIRTIO_CRYPTO_F_AKCIPHER_STATELESS_MODE is NOT negotiated, =
\field{op_flf}
> +        is struct virtio_crypto_akcipher_data_flf if VIRTIO_CRYPTO_F_REV=
ISION_1 is negotiated
> +        and struct virtio_crypto_akcipher_data_flf is padded to 48 bytes=
 if NOT negotiated,
> +        and \field{op_vlf} is struct virtio_crypto_akcipher_data_vlf.
> +    \end{itemize*}
> \end{itemize*}
>=20
> \field{inhdr} is a unified input header that used to return the status of
> @@ -1533,3 +1713,132 @@ \subsubsection{AEAD Service Operation}\label{sec:=
Device Types / Crypto Device /
> \item VIRTIO_CRYPTO_ERR if any failure not mentioned above occurs.
> \end{itemize*}
> \end{itemize*}
> +
> +\subsubsection{AKCIPHER Service Operation}\label{sec:Device Types / Cryp=
to Device / Device Operation / AKCIPHER Service Operation}
> +
> +Session mode AKCIPHER requests are as follows:
> +
> +\begin{lstlisting}
> +struct virtio_crypto_akcipher_data_flf {
> +    /* length of source data */
> +    le32 src_data_len;
> +    /* length of dst data */
> +    le32 dst_data_len;
> +};
> +
> +struct virtio_crypto_akcipher_data_vlf {
> +    /* Device read only portion */
> +    /* Source data */
> +    u8 src_data[src_data_len];
> +
> +    /* Device write only portion */
> +    /* Pointer to output data */
> +    u8 dst_data[dst_data_len];
> +};
> +\end{lstlisting}
> +
> +Each data request uses the virtio_crypto_akcipher_flf structure and the =
virtio_crypto_akcipher_data_vlf
> +structure to store information used to run the AKCIPHER operations.
> +
> +For encryption, decryption, and signing:
> +\field{src_data} is the source data that will be processed, note that fo=
r signing operations,
> +src_data stores the data to be signed, which usually is the digest of so=
me data rather than the
> +data itself.
> +\field{src_data_len} is the length of source data.
> +\field{dst_result} is the result data and \field{dst_data_len} is the le=
ngth of it.
> +
> +For verification:
> +\field{src_data_len} refers to the length of the signature, and \field{d=
st_data_len} refers to
> +the length of signed data, where the signed data is usually the digest o=
f some data.
> +\field{src_data} is spliced by the signature and the signed data, the sr=
c_data with the lower
> +address stores the signature, and the higher address stores the signed d=
ata.
> +\field{dst_data} is always empty for verification.
> +
> +Different algorithms have different signature formats.
> +For the RSA algorithm, the result is determined by the padding algorithm=
 specified by
> +\field{padding_algo} in structure virtio_crypto_rsa_session_para.
> +
> +For the ECDSA algorithm, the signature is composed of the following
> +ASN.1 structure(see \hyperref[intro:rfc3279]{RFC3279})
> +and MUST be DER encoded.
> +\begin{lstlisting}
> +Ecdsa-Sig-Value ::=3D SEQUENCE {
> +    r INTEGER,
> +    s INTEGER
> +}
> +\end{lstlisting}
> +
> +Stateless mode AKCIPHER service requests are as follows:
> +\begin{lstlisting}
> +struct virtio_crypto_akcipher_data_flf_stateless {
> +    struct {
> +        /* See VIRTIO_CYRPTO_AKCIPHER* above */
> +        le32 algo;
> +        /* See VIRTIO_CRYPTO_AKCIPHER_KEY_TYPE_* above */
> +        le32 key_type;
> +        /* length of key */
> +        le32 key_len;
> +
> +        /* algothrim specific parameters described above */
> +        union {
> +            struct virtio_crypto_rsa_session_para rsa;
> +            struct virtio_crypto_ecdsa_session_para ecdsa;
> +        } u;
> +    } sess_para;
> +
> +    /* length of source data */
> +    le32 src_data_len;
> +    /* length of destination data */
> +    le32 dst_data_len;
> +};
> +
> +struct virtio_crypto_akcipher_data_vlf_stateless {
> +    /* Device read only portion */
> +    u8 akcipher_key[key_len];
> +
> +    /* Source data */
> +    u8 src_data[src_data_len];
> +
> +    /* Device write only portion */
> +    u8 dst_data[dst_data_len];
> +};
> +\end{lstlisting}
> +
> +In stateless mode, the format of key and signature, the meaning of src_d=
ata and dst_data, are all the same
> +with session mode.
> +
> +\drivernormative{\paragraph}{AKCIPHER Service Operation}{Device Types / =
Crypto Device / Device Operation / AKCIPHER Service Operation}
> +
> +\begin{itemize*}
> +\item If the driver uses the session mode, then the driver MUST set
> +    \field{session_id} in struct virtio_crypto_op_header to a valid
> +    value assigned by the device when the session was created.
> +\item If the VIRTIO_CRYPTO_F_AKCIPHER_STATELESS_MODE feature bit is nego=
tiated, 1) if the
> +    driver uses the stateless mode, then the driver MUST set the \field{=
flag} field in
> +    struct virtio_crypto_op_header to ZERO and MUST set the fields in st=
ruct
> +    virtio_crypto_akcipher_flf_stateless.sess_para, 2) if the driver use=
s the session
> +    mode, then the driver MUST set the \field{flag} field in struct virt=
io_crypto_op_header
> +    to VIRTIO_CRYPTO_FLAG_SESSION_MODE.
> +\item The driver MUST set the \field{opcode} field in struct virtio_cryp=
to_op_header
> +    to one of VIRTIO_CRYPTO_AKCIPHER_ENCRYPT, VIRTIO_CRYPTO_AKCIPHER_DES=
TROY_SESSION,
> +    VIRTIO_CRYPTO_AKCIPHER_SIGN, and VIRTIO_CRYPTO_AKCIPHER_VERIFY.
> +\end{itemize*}
> +
> +\devicenormative{\paragraph}{AKCIPHER Service Operation}{Device Types / =
Crypto Device / Device Operation / AKCIPHER Service Operation}
> +
> +\begin{itemize*}
> +\item If the VIRTIO_CRYPTO_F_AKCIPHER_STATELESS_MODE feature bit is nego=
tiated, the
> +    device MUST parse the virtio_crypto_akcipher_data_vlf_stateless base=
d on the \field{opcode}
> +    field in general header.
> +\item The device MUST copy the result of cryptographic operation in the =
dst_data[].
> +\item The device MUST set the \field{status} field in struct virtio_cryp=
to_inhdr to
> +    one of the following values of enum VIRTIO_CRYPTO_STATUS:
> +\begin{itemize*}
> +\item VIRTIO_CRYPTO_OK if the operation success.
> +\item VIRTIO_CRYPTO_NOTSUPP if the requested algorithm or operation is u=
nsupported.
> +\item VIRTIO_CRYPTO_BADMSG if the verification result is incorrect.
> +\item VIRTIO_CRYPTO_INVSESS if the session ID invalid when in session mo=
de.
> +\item VIRTIO_CRYPTO_KEY_REJECTED if the signature verification failed.
> +\item VIRTIO_CRYPTO_ERR if any failure not mentioned above occurs.
> +\end{itemize*}
> +\end{itemize*}
> --=20
> 2.11.0
>=20


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

