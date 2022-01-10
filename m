Return-Path: <virtio-comment-return-2500-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8D1BC986254
	for <virtio-comment@lists.oasis-open.org>; Mon, 10 Jan 2022 12:55:16 +0000 (UTC)
Date: Mon, 10 Jan 2022 07:55:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20220110075430-mutt-send-email-mst@kernel.org>
References: <20211210125329.72786-1-helei.sig11@bytedance.com>
 <20211210125329.72786-2-helei.sig11@bytedance.com>
 <90C9891E-5950-46AF-830F-2A2BB60CE5D0@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <90C9891E-5950-46AF-830F-2A2BB60CE5D0@bytedance.com>
Subject: [virtio-comment] Re: PING: [V3 PATCH 1/1] virtio-crypto: introduce akcipher service
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
To: =?utf-8?B?5L2V56OK?= <helei.sig11@bytedance.com>
Cc: virtio-comment@lists.oasis-open.org, pizhenwei@bytedance.com, xin.zeng@intel.com, arei.gonglei@huawei.com
List-ID: <virtio-comment.lists.oasis-open.org>

It's been a month, let's start voting? If yes pls follow the
use of github issues workflow as described in README.
Thanks!

On Mon, Jan 10, 2022 at 08:20:31PM +0800, =E4=BD=95=E7=A3=8A wrote:
> Ping,  can someone help take a look at this patch? thanks.
>=20
> > On Dec 10, 2021, at 8:53 PM, Lei He <helei.sig11@bytedance.com> wrote:
> >=20
> > Introduce akcipher (asymmetric key cipher) service type, several
> > asymmetric algorithms and relevent information:
> >  - RSA(padding algorithm, ASN.1 schema definition)
> >  - ECDSA(ECC algorithm)
> >=20
> > Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> > Signed-off-by: Lei He <helei.sig11@bytedance.com>
> > ---
> > introduction.tex  |  12 +++
> > virtio-crypto.tex | 317 +++++++++++++++++++++++++++++++++++++++++++++++=
++++++-
> > 2 files changed, 325 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/introduction.tex b/introduction.tex
> > index 6d52717..92a6911 100644
> > --- a/introduction.tex
> > +++ b/introduction.tex
> > @@ -79,6 +79,18 @@ \section{Normative References}\label{sec:Normative R=
eferences}
> > =09\phantomsection\label{intro:SCMI}\textbf{[SCMI]} &
> > =09Arm System Control and Management Interface, DEN0056,
> > =09\newline\url{https://developer.arm.com/docs/den0056/c}, version C an=
d any future revisions\\
> > +=09\phantomsection\label{intro:rfc3447}\textbf{[RFC3447]} &
> > +    J. Jonsson.,``Public-Key Cryptography Standards (PKCS) \#1: RSA Cr=
yptography'', February 2003.
> > +=09\newline\url{https://www.ietf.org/rfc/rfc3447.txt}\\
> > +=09\phantomsection\label{intro:NIST}\textbf{[FIPS186-3]} &
> > +     National Institute of Standards and Technology (NIST), FIPS Publi=
cation 180-3: Secure Hash Standard, October 2008.
> > +=09\newline\url{https://csrc.nist.gov/csrc/media/publications/fips/186=
/3/archive/2009-06-25/documents/fips_186-3.pdf}\\
> > +    \phantomsection\label{intro:rfc6025}\textbf{[RFC6025]} &
> > +    C.Wallace., ``ASN.1 Translation'', October 2010.
> > +    \newline\url{https://www.ietf.org/rfc/rfc6025.txt}\\
> > +    \phantomsection\label{intro:rfc3279}\textbf{[RFC3279]} &
> > +    W.Polk., ``Algorithms and Identifiers for the Internet X.509 Publi=
c Key Infrastructure Certificate and Certificate Revocation List (CRL) Prof=
ile'', April 2002.
> > +    \newline\url{https://www.ietf.org/rfc/rfc3279.txt}\\
> >=20
> > \end{longtable}
> >=20
> > diff --git a/virtio-crypto.tex b/virtio-crypto.tex
> > index 74746f9..256c144 100644
> > --- a/virtio-crypto.tex
> > +++ b/virtio-crypto.tex
> > @@ -2,7 +2,7 @@ \section{Crypto Device}\label{sec:Device Types / Crypto=
 Device}
> >=20
> > The virtio crypto device is a virtual cryptography device as well as a
> > virtual cryptographic accelerator. The virtio crypto device provides th=
e
> > -following crypto services: CIPHER, MAC, HASH, and AEAD. Virtio crypto
> > +following crypto services: CIPHER, MAC, HASH, AEAD and AKCIPHER. Virti=
o crypto
> > devices have a single control queue and at least one data queue. Crypto
> > operation requests are placed into a data queue, and serviced by the
> > device. Some crypto operation requests are only valid in the context of=
 a
> > @@ -39,6 +39,8 @@ \subsection{Feature bits}\label{sec:Device Types / Cr=
ypto Device / Feature bits}
> >     supported by the MAC service.
> > \item VIRTIO_CRYPTO_F_AEAD_STATELESS_MODE (4) stateless mode requests a=
re
> >     supported by the AEAD service.
> > +\item VIRTIO_CRYPTO_F_AKCIPHER_STATELESS_MODE (5) stateless mode reque=
sts are
> > +    supported by the AKCIPHER service.
> > \end{description}
> >=20
> >=20
> > @@ -52,6 +54,7 @@ \subsubsection{Feature bit requirements}\label{sec:De=
vice Types / Crypto Device
> > \item[VIRTIO_CRYPTO_F_HASH_STATELESS_MODE] Requires VIRTIO_CRYPTO_F_REV=
ISION_1.
> > \item[VIRTIO_CRYPTO_F_MAC_STATELESS_MODE] Requires VIRTIO_CRYPTO_F_REVI=
SION_1.
> > \item[VIRTIO_CRYPTO_F_AEAD_STATELESS_MODE] Requires VIRTIO_CRYPTO_F_REV=
ISION_1.
> > +\item[VIRTIO_CRYPTO_F_AKCIPHER_STATELESS_MODE] Requires VIRTIO_CRYPTO_=
F_REVISION_1.
> > \end{description}
> >=20
> > \subsection{Supported crypto services}\label{sec:Device Types / Crypto =
Device / Supported crypto services}
> > @@ -59,7 +62,7 @@ \subsection{Supported crypto services}\label{sec:Devi=
ce Types / Crypto Device /
> > The following crypto services are defined:
> >=20
> > \begin{lstlisting}
> > -/* CIPHER service */
> > +/* CIPHER (Symmetric Key Cipher) service */
> > #define VIRTIO_CRYPTO_SERVICE_CIPHER 0
> > /* HASH service */
> > #define VIRTIO_CRYPTO_SERVICE_HASH   1
> > @@ -67,6 +70,8 @@ \subsection{Supported crypto services}\label{sec:Devi=
ce Types / Crypto Device /
> > #define VIRTIO_CRYPTO_SERVICE_MAC    2
> > /* AEAD (Authenticated Encryption with Associated Data) service */
> > #define VIRTIO_CRYPTO_SERVICE_AEAD   3
> > +/* AKCIPHER (Asymmetric Key Cipher) service */
> > +#define VIRTIO_CRYPTO_SERVICE_AKCIPHER 4
> > \end{lstlisting}
> >=20
> > The above constants designate bits used to indicate the which of crypto=
 services are
> > @@ -181,6 +186,24 @@ \subsubsection{AEAD services}\label{sec:Device Typ=
es / Crypto Device / Supported
> > operation requests, see \ref{sec:Device Types / Crypto Device / Device =
Operation / Control Virtqueue / Session operation}.
> > \end{enumerate}
> >=20
> > +\subsubsection{AKCIPHER services}\label{sec: Device Types / Crypto Dev=
ice / Supported crypto services / AKCIPHER services}
> > +
> > +The following AKCIPHER algorithms are defined:
> > +\begin{lstlisting}
> > +#define VIRTIO_CRYPTO_NO_AKCIPHER 0
> > +#define VIRTIO_CRYPTO_AKCIPHER_RSA   1
> > +#define VIRTIO_CRYPTO_AKCIPHER_ECDSA 2
> > +\end{lstlisting}
> > +
> > +The above constants have two usages:
> > +\begin{enumerate}
> > +\item As bit numbers, used to tell the driver which AKCIPHER algorithm=
s
> > +are supported by the device, see \ref{sec:Device Types / Crypto Device=
 / Device configuration layout}.
> > +\item As values, used to designate the algorithm in asymmetric crypto =
operation requests,
> > +see \ref{sec:Device Types / Crypto Device / Device Operation / Control=
 Virtqueue / Session operation}.
> > +\end{enumerate}
> > +
> > +
> > \subsection{Device configuration layout}\label{sec:Device Types / Crypt=
o Device / Device configuration layout}
> >=20
> > Crypto device configuration uses the following layout structure:
> > @@ -204,6 +227,7 @@ \subsection{Device configuration layout}\label{sec:=
Device Types / Crypto Device
> >     le32 reserved;
> >     /* Maximum size of each crypto request's content in bytes */
> >     le64 max_size;
> > +    le32 akcipher_algo;
> > };
> > \end{lstlisting}
> >=20
> > @@ -241,6 +265,7 @@ \subsection{Device configuration layout}\label{sec:=
Device Types / Crypto Device
> >=20
> > \item [\field{max_size}] is the maximum size of the variable-length par=
ameters of
> >     data operation of each crypto request's content supported by the de=
vice.
> > +\item [\field{akcipher_algo}] AKCIPHER algorithms bit 0-31, see \ref{s=
ec: Device Types / Crypto Device / Supported crypto services / AKCIPHER ser=
vices}.
> > \end{description}
> >=20
> > \begin{note}
> > @@ -323,6 +348,7 @@ \subsubsection{Operation Status}\label{sec:Device T=
ypes / Crypto Device / Device
> >     VIRTIO_CRYPTO_NOTSUPP =3D 3,
> >     VIRTIO_CRYPTO_INVSESS =3D 4,
> >     VIRTIO_CRYPTO_NOSPC =3D 5,
> > +    VIRTIO_CRYPTO_KEY_REJECTED =3D 6,
> >     VIRTIO_CRYPTO_MAX
> > };
> > \end{lstlisting}
> > @@ -334,6 +360,7 @@ \subsubsection{Operation Status}\label{sec:Device T=
ypes / Crypto Device / Device
> > \item VIRTIO_CRYPTO_INVSESS: invalid session ID when executing crypto o=
perations.
> > \item VIRTIO_CRYPTO_NOSPC: no free session ID (only when the VIRTIO_CRY=
PTO_F_REVISION_1
> >     feature bit is negotiated).
> > +\item VIRTIO_CRYPTO_KEY_REJECTED: signature verification failed (only =
when AKCIPHER verification).
> > \item VIRTIO_CRYPTO_ERR: any failure not mentioned above occurs.
> > \end{itemize*}
> >=20
> > @@ -364,6 +391,10 @@ \subsubsection{Control Virtqueue}\label{sec:Device=
 Types / Crypto Device / Devic
> >        VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AEAD, 0x02)
> > #define VIRTIO_CRYPTO_AEAD_DESTROY_SESSION \
> >        VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AEAD, 0x03)
> > +#define VIRTIO_CRYPTO_AKCIPHER_CREATE_SESSION \
> > +       VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x04)
> > +#define VIRTIO_CRYPTO_AKCIPHER_DESTROY_SESSION \
> > +       VIRTIO_CRYPTO_OPCDE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x05)
> >     le32 opcode;
> >     /* algo should be service-specific algorithms */
> >     le32 algo;
> > @@ -427,6 +458,11 @@ \subsubsection{Control Virtqueue}\label{sec:Device=
 Types / Crypto Device / Devic
> >     VIRTIO_CRYPTO_F_REVISION_1 is negotiated and struct virtio_crypto_a=
ead_create_session_flf is
> >     padded to 56 bytes if NOT negotiated, and \field{op_vlf} is struct
> >     virtio_crypto_aead_create_session_vlf.
> > +\item If the opcode (in \field{header}) is VIRTIO_CRYPTO_AKCIPHER_CREA=
TE_SESSION
> > +    then \field{op_flf} is struct virtio_crypto_akcipher_create_sessio=
n_flf if
> > +    VIRTIO_CRYPTO_F_REVISION_1 is negotiated and struct virtio_crypto_=
akcipher_create_session_flf is
> > +    padded to 56 bytes if NOT negotiated, and \field{op_vlf} is struct
> > +    virtio_crypto_akcipher_create_session_vlf.
> > \item If the opcode (in \field{header}) is VIRTIO_CRYPTO_CIPHER_DESTROY=
_SESSION
> >     or VIRTIO_CRYPTO_HASH_DESTROY_SESSION or VIRTIO_CRYPTO_MAC_DESTROY_=
SESSION or
> >     VIRTIO_CRYPTO_AEAD_DESTROY_SESSION then \field{op_flf} is struct
> > @@ -690,12 +726,137 @@ \subsubsection{Control Virtqueue}\label{sec:Devi=
ce Types / Crypto Device / Devic
> > The length of \field{key} is specified in \field{key_len} in struct
> > virtio_crypto_aead_create_session_flf.
> >=20
> > +\subparagraph{Session operation: AKCIPHER session}\label{sec:Device Ty=
pes / Crypto Device / Device
> > +Operation / Control Virtqueue / Session operation / Session operation:=
 AKCIPHER session}
> > +
> > +Due to the complexity of asymmetric key algorithms, different algorith=
ms
> > +require different parameters. The following data structures are used a=
s
> > +supplementary parameters to describe the asymmetric algorithm sessions=
.
> > +
> > +For the RSA algorithm, the extra parameters are as follows:
> > +\begin{lstlisting}
> > +struct virtio_crypto_rsa_session_para {
> > +#define VIRTIO_CRYPTO_RSA_RAW_PADDING   0
> > +#define VIRTIO_CRYPTO_RSA_PKCS1_PADDING 1
> > +    le32 padding_algo;
> > +
> > +#define VIRTIO_CRYPTO_RSA_NO_HASH   0
> > +#define VIRTIO_CRYPTO_RSA_MD2       1
> > +#define VIRTIO_CRYPTO_RSA_MD3       2
> > +#define VIRTIO_CRYPTO_RSA_MD4       3
> > +#define VIRTIO_CRYPTO_RSA_MD5       4
> > +#define VIRTIO_CRYPTO_RSA_SHA1      5
> > +#define VIRTIO_CRYPTO_RSA_SHA256    6
> > +#define VIRTIO_CRYPTO_RSA_SHA384    7
> > +#define VIRTIO_CRYPTO_RSA_SHA512    8
> > +#define VIRTIO_CRYPTO_RSA_SHA224    9
> > +    le32 hash_algo;
> > +};
> > +\end{lstlisting}
> > +
> > +\field{padding_algo} specifies the padding method used by RSA sessions=
.
> > +\begin{itemize*}
> > +\item If VIRTIO_CRYPTO_RSA_RAW_PADDING is specified, 1) \field{hash_al=
go}
> > +is ignored, 2) ciphertext and plaintext MUST be padded with leading ze=
ros,
> > +3) and RSA sessions with VIRTIO_CRYPTO_RSA_RAW_PADDING MUST not be use=
d
> > +for verification and signing operations.
> > +\item If VIRTIO_CRYPTO_RSA_PKCS1_PADDING is specified, EMSA-PKCS1-v1_5=
 padding method
> > +is used(see \hyperref[intro:rfc3447]{PKCS\#1}), \field{hash_algo} spec=
ifies how the
> > +digest of the data passed to RSA sessions is calculated when verifying=
 and signing.
> > +It only affects the padding algorithm and is ignored during encryption=
 and decryption.
> > +\end{itemize*}
> > +
> > +The ECC algorithms such as the ECDSA algorithm, cannot use custom curv=
es, only the
> > +following known curves can be used(see \hyperref[intro:NIST]{NIST-reco=
mmended curves})
> > +
> > +\begin{lstlisting}
> > +#define VIRTIO_CRYPTO_CURVE_UNKNOWN   0
> > +#define VIRTIO_CRYPTO_CURVE_NIST_P192 1
> > +#define VIRTIO_CRYPTO_CURVE_NIST_P224 2
> > +#define VIRTIO_CRYPTO_CURVE_NIST_P256 3
> > +#define VIRTIO_CRYPTO_CURVE_NIST_P384 4
> > +#define VIRTIO_CRYPTO_CURVE_NIST_P521 5
> > +\end{lstlisting}
> > +
> > +For the ECDSA algorithm, the extra parameters are as follows:
> > +\begin{lstlisting}
> > +struct virtio_crypto_ecdsa_session_para {
> > +    /* See VIRTIO_CRYPTO_CURVE_* above */
> > +    le32 curve_id;
> > +};
> > +\end{lstlisting}
> > +
> > +The fixed-length and the variable-length parameters of AKCIPHER sessio=
n requests are as follows:
> > +\begin{lstlisting}
> > +struct virtio_crypto_akcipher_create_session_flf {
> > +    /* Device read only portion */
> > +
> > +    /* See VIRTIO_CRYPTO_AKCIPHER_* above */
> > +    le32 algo;
> > +#define VIRTIO_CRYPTO_AKCIPHER_KEY_TYPE_PUBLIC 1
> > +#define VIRTIO_CRYPTO_AKCIPHER_KEY_TYPE_PRIVATE 2
> > +    le32 key_type;
> > +    /* length of key */
> > +    le32 key_len;
> > +
> > +#define VIRTIO_CRYPTO_AKCIPHER_SESS_ALGO_SPEC_HDR_SIZE 44
> > +    u8 algo_flf[VIRTIO_CRYPTO_AKCIPHER_SESS_ALGO_SPEC_HDR_SIZE];
> > +};
> > +
> > +struct virtio_crypto_akcipher_create_session_vlf {
> > +    /* Device read only portion */
> > +    u8 key[key_len];
> > +};
> > +\end{lstlisting}
> > +
> > +\field{algo} decides the type used by \field{algo_flf}.
> > +\field{algo_flf} is fixed to 44 bytes and MUST contains of be one the
> > +following structures:
> > +\begin{itemize*}
> > +\item struct virtio_crypto_rsa_session_para
> > +\item struct virtio_crypto_ecdsa_session_para
> > +\end{itemize*}
> > +
> > +The length of \field{key} is specified in \field{key_len} in the struc=
t
> > +virtio_crypto_akcipher_create_session_flf.
> > +
> > +If the key of an asymmetric algorithm contains multiple fields, for ex=
ample,
> > +the RSA key pairs, they MUST be described using the
> > +ASN.1 structure and MUST be DER encoded (see \hyperref[intro:rfc6025]{=
rfc6025}).
> > +If the key of an asymmetric algorithm only contains an integer field, =
for example,
> > +the ECDSA private key, then MUST be encoded with I2OSP primitives desc=
ribed in
> > +\hyperref[intro:rfc3447]{PKCS\#1}.
> > +
> > +The schema of RSA keys is described with the RSAPrivateKey and RSAPubl=
icKey structure defined in
> > +\hyperref[intro:rfc3447]{PKCS\#1}.
> > +
> > +\begin{lstlisting}
> > +RsaPrivateKey ::=3D SEQUENCE {
> > +    version          INTEGER
> > +    modulus          INTEGER
> > +    publicExponent   INTEGER
> > +    privateExponent  INTEGER
> > +    prime1           INTEGER
> > +    prime2           INTEGER
> > +    exponent1        INTEGER
> > +    exponent1        INTEGER
> > +    coefficient      INTEGER
> > +}
> > +
> > +RsaPublicKey ::=3D SEQUENCE {
> > +    modulus         INTEGER
> > +    publicExponent  INTEGER
> > +}
> > +\end{lstlisting}
> > +
> > +The length of \field{key} is specified in \field{key_len} in
> > +struct virtio_crypto_akcipher_create_session_flf.
> >=20
> > \drivernormative{\subparagraph}{Session operation: create session}{Devi=
ce Types / Crypto Device / Device
> > Operation / Control Virtqueue / Session operation / Session operation: =
create session}
> >=20
> > \begin{itemize*}
> > -\item The driver MUST set the \field{opcode} field based on service ty=
pe: CIPHER, HASH, MAC, or AEAD.
> > +\item The driver MUST set the \field{opcode} field based on service ty=
pe: CIPHER, HASH, MAC, AEAD or AKCIPHER.
> > \item The driver MUST set the control general header, the opcode specif=
ic header,
> >     the opcode specific extra parameters and the opcode specific outcom=
e buffer in turn.
> >     See \ref{sec:Device Types / Crypto Device / Device Operation / Cont=
rol Virtqueue}.
> > @@ -726,7 +887,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device =
Types / Crypto Device / Devic
> > Operation / Control Virtqueue / Session operation / Session operation: =
destroy session}
> >=20
> > \begin{itemize*}
> > -\item The driver MUST set the \field{opcode} field based on service ty=
pe: CIPHER, HASH, MAC, or AEAD.
> > +\item The driver MUST set the \field{opcode} field based on service ty=
pe: CIPHER, HASH, MAC, AEAD or AKCIPHER.
> > \item The driver MUST set the \field{session_id} to a valid value assig=
ned by the device
> >     when the session was created.
> > \end{itemize*}
> > @@ -764,6 +925,14 @@ \subsubsection{Data Virtqueue}\label{sec:Device Ty=
pes / Crypto Device / Device O
> >     VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AEAD, 0x00)
> > #define VIRTIO_CRYPTO_AEAD_DECRYPT \
> >     VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AEAD, 0x01)
> > +#define VIRTIO_CRYPTO_AKCIPHER_ENCRYPT \
> > +    VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x00)
> > +#define VIRTIO_CRYPTO_AKCIPHER_DECRYPT \
> > +    VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x01)
> > +#define VIRTIO_CRYPTO_AKCIPHER_SIGN \
> > +    VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x02)
> > +#define VIRTIO_CRYPTO_AKCIPHER_VERIFY \
> > +    VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x03)
> >     le32 opcode;
> >     /* algo should be service-specific algorithms */
> >     le32 algo;
> > @@ -857,6 +1026,17 @@ \subsubsection{Data Virtqueue}\label{sec:Device T=
ypes / Crypto Device / Device O
> >         and struct virtio_crypto_aead_data_flf is padded to 48 bytes if=
 NOT negotiated,
> >         and \field{op_vlf} is struct virtio_crypto_aead_data_vlf.
> >     \end{itemize*}
> > +\item If the opcode (in \field{header}) is VIRTIO_CRYPTO_AKCIPHER_ENCR=
YPT, VIRTIO_CRYPTO_AKCIPHER_DECRYPT,
> > +    VIRTIO_CRYPTO_AKCIPHER_SIGN or VIRTIO_CRYPTO_AKCIPHER_VERIFY then:
> > +    \begin{itemize*}
> > +    \item If VIRTIO_CRYPTO_F_AKCIPHER_STATELESS_MODE is negotiated, \f=
ield{op_flf} is
> > +        struct virtio_crypto_akcipher_data_flf_statless, and \field{op=
_vlf} is struct
> > +        virtio_crypto_akcipher_data_vlf_stateless.
> > +    \item If VIRTIO_CRYPTO_F_AKCIPHER_STATELESS_MODE is NOT negotiated=
, \field{op_flf}
> > +        is struct virtio_crypto_akcipher_data_flf if VIRTIO_CRYPTO_F_R=
EVISION_1 is negotiated
> > +        and struct virtio_crypto_akcipher_data_flf is padded to 48 byt=
es if NOT negotiated,
> > +        and \field{op_vlf} is struct virtio_crypto_akcipher_data_vlf.
> > +    \end{itemize*}
> > \end{itemize*}
> >=20
> > \field{inhdr} is a unified input header that used to return the status =
of
> > @@ -1533,3 +1713,132 @@ \subsubsection{AEAD Service Operation}\label{se=
c:Device Types / Crypto Device /
> > \item VIRTIO_CRYPTO_ERR if any failure not mentioned above occurs.
> > \end{itemize*}
> > \end{itemize*}
> > +
> > +\subsubsection{AKCIPHER Service Operation}\label{sec:Device Types / Cr=
ypto Device / Device Operation / AKCIPHER Service Operation}
> > +
> > +Session mode AKCIPHER requests are as follows:
> > +
> > +\begin{lstlisting}
> > +struct virtio_crypto_akcipher_data_flf {
> > +    /* length of source data */
> > +    le32 src_data_len;
> > +    /* length of dst data */
> > +    le32 dst_data_len;
> > +};
> > +
> > +struct virtio_crypto_akcipher_data_vlf {
> > +    /* Device read only portion */
> > +    /* Source data */
> > +    u8 src_data[src_data_len];
> > +
> > +    /* Device write only portion */
> > +    /* Pointer to output data */
> > +    u8 dst_data[dst_data_len];
> > +};
> > +\end{lstlisting}
> > +
> > +Each data request uses the virtio_crypto_akcipher_flf structure and th=
e virtio_crypto_akcipher_data_vlf
> > +structure to store information used to run the AKCIPHER operations.
> > +
> > +For encryption, decryption, and signing:
> > +\field{src_data} is the source data that will be processed, note that =
for signing operations,
> > +src_data stores the data to be signed, which usually is the digest of =
some data rather than the
> > +data itself.
> > +\field{src_data_len} is the length of source data.
> > +\field{dst_result} is the result data and \field{dst_data_len} is the =
length of it.
> > +
> > +For verification:
> > +\field{src_data_len} refers to the length of the signature, and \field=
{dst_data_len} refers to
> > +the length of signed data, where the signed data is usually the digest=
 of some data.
> > +\field{src_data} is spliced by the signature and the signed data, the =
src_data with the lower
> > +address stores the signature, and the higher address stores the signed=
 data.
> > +\field{dst_data} is always empty for verification.
> > +
> > +Different algorithms have different signature formats.
> > +For the RSA algorithm, the result is determined by the padding algorit=
hm specified by
> > +\field{padding_algo} in structure virtio_crypto_rsa_session_para.
> > +
> > +For the ECDSA algorithm, the signature is composed of the following
> > +ASN.1 structure(see \hyperref[intro:rfc3279]{RFC3279})
> > +and MUST be DER encoded.
> > +\begin{lstlisting}
> > +Ecdsa-Sig-Value ::=3D SEQUENCE {
> > +    r INTEGER,
> > +    s INTEGER
> > +}
> > +\end{lstlisting}
> > +
> > +Stateless mode AKCIPHER service requests are as follows:
> > +\begin{lstlisting}
> > +struct virtio_crypto_akcipher_data_flf_stateless {
> > +    struct {
> > +        /* See VIRTIO_CYRPTO_AKCIPHER* above */
> > +        le32 algo;
> > +        /* See VIRTIO_CRYPTO_AKCIPHER_KEY_TYPE_* above */
> > +        le32 key_type;
> > +        /* length of key */
> > +        le32 key_len;
> > +
> > +        /* algothrim specific parameters described above */
> > +        union {
> > +            struct virtio_crypto_rsa_session_para rsa;
> > +            struct virtio_crypto_ecdsa_session_para ecdsa;
> > +        } u;
> > +    } sess_para;
> > +
> > +    /* length of source data */
> > +    le32 src_data_len;
> > +    /* length of destination data */
> > +    le32 dst_data_len;
> > +};
> > +
> > +struct virtio_crypto_akcipher_data_vlf_stateless {
> > +    /* Device read only portion */
> > +    u8 akcipher_key[key_len];
> > +
> > +    /* Source data */
> > +    u8 src_data[src_data_len];
> > +
> > +    /* Device write only portion */
> > +    u8 dst_data[dst_data_len];
> > +};
> > +\end{lstlisting}
> > +
> > +In stateless mode, the format of key and signature, the meaning of src=
_data and dst_data, are all the same
> > +with session mode.
> > +
> > +\drivernormative{\paragraph}{AKCIPHER Service Operation}{Device Types =
/ Crypto Device / Device Operation / AKCIPHER Service Operation}
> > +
> > +\begin{itemize*}
> > +\item If the driver uses the session mode, then the driver MUST set
> > +    \field{session_id} in struct virtio_crypto_op_header to a valid
> > +    value assigned by the device when the session was created.
> > +\item If the VIRTIO_CRYPTO_F_AKCIPHER_STATELESS_MODE feature bit is ne=
gotiated, 1) if the
> > +    driver uses the stateless mode, then the driver MUST set the \fiel=
d{flag} field in
> > +    struct virtio_crypto_op_header to ZERO and MUST set the fields in =
struct
> > +    virtio_crypto_akcipher_flf_stateless.sess_para, 2) if the driver u=
ses the session
> > +    mode, then the driver MUST set the \field{flag} field in struct vi=
rtio_crypto_op_header
> > +    to VIRTIO_CRYPTO_FLAG_SESSION_MODE.
> > +\item The driver MUST set the \field{opcode} field in struct virtio_cr=
ypto_op_header
> > +    to one of VIRTIO_CRYPTO_AKCIPHER_ENCRYPT, VIRTIO_CRYPTO_AKCIPHER_D=
ESTROY_SESSION,
> > +    VIRTIO_CRYPTO_AKCIPHER_SIGN, and VIRTIO_CRYPTO_AKCIPHER_VERIFY.
> > +\end{itemize*}
> > +
> > +\devicenormative{\paragraph}{AKCIPHER Service Operation}{Device Types =
/ Crypto Device / Device Operation / AKCIPHER Service Operation}
> > +
> > +\begin{itemize*}
> > +\item If the VIRTIO_CRYPTO_F_AKCIPHER_STATELESS_MODE feature bit is ne=
gotiated, the
> > +    device MUST parse the virtio_crypto_akcipher_data_vlf_stateless ba=
sed on the \field{opcode}
> > +    field in general header.
> > +\item The device MUST copy the result of cryptographic operation in th=
e dst_data[].
> > +\item The device MUST set the \field{status} field in struct virtio_cr=
ypto_inhdr to
> > +    one of the following values of enum VIRTIO_CRYPTO_STATUS:
> > +\begin{itemize*}
> > +\item VIRTIO_CRYPTO_OK if the operation success.
> > +\item VIRTIO_CRYPTO_NOTSUPP if the requested algorithm or operation is=
 unsupported.
> > +\item VIRTIO_CRYPTO_BADMSG if the verification result is incorrect.
> > +\item VIRTIO_CRYPTO_INVSESS if the session ID invalid when in session =
mode.
> > +\item VIRTIO_CRYPTO_KEY_REJECTED if the signature verification failed.
> > +\item VIRTIO_CRYPTO_ERR if any failure not mentioned above occurs.
> > +\end{itemize*}
> > +\end{itemize*}
> > --=20
> > 2.11.0
> >=20


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

