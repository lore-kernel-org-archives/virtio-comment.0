Return-Path: <virtio-comment-return-2330-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2C1D298644F
	for <virtio-comment@lists.oasis-open.org>; Fri,  5 Nov 2021 09:56:32 +0000 (UTC)
From: =?utf-8?B?5L2V56OK?= <helei.sig11@bytedance.com>
Message-Id: <3E143D1D-8D0C-4AA8-953F-21DD24F3CB80@bytedance.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Date: Fri, 5 Nov 2021 17:55:53 +0800
In-Reply-To: <20211104080418-mutt-send-email-mst@kernel.org>
References: <20211025033045.82123-1-helei.sig11@bytedance.com>
 <20211025033045.82123-2-helei.sig11@bytedance.com>
 <20211104080418-mutt-send-email-mst@kernel.org>
Subject: [virtio-comment] :
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_78058476-023A-46DB-ACAE-372BBAD41DC3"
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, xin.zeng@intel.com, arei.gonglei@huawei.com, pizhenwei@bytedance.com
List-ID: <virtio-comment.lists.oasis-open.org>

--Apple-Mail=_78058476-023A-46DB-ACAE-372BBAD41DC3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Glad to receive the reply and thank you for the review. I fixed the typos a=
nd grammatical errors.=20
I have responded some questions below, and will provide v2 patch as soon as=
 possible.


> On Nov 4, 2021, at 8:14 PM, Michael S. Tsirkin <mst@redhat.com> wrote:
>=20
> On Mon, Oct 25, 2021 at 11:30:45AM +0800, Lei He wrote:
>> Introduce asym service type, several asymmetric algorithms and
>> relevent information:
>>  - RSA(padding algorithm, ASN.1 schema definition)
>>  - DSA
>>  - ECDSA(ecc algorithm)
>>=20
>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>> Signed-off-by: Lei He <helei.sig11@bytedance.com>
>> ---
>> virtio-crypto.tex | 214 ++++++++++++++++++++++++++++++++++++++++++++++++=
+++++-
>> 1 file changed, 210 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/virtio-crypto.tex b/virtio-crypto.tex
>> index 74746f9..53339a1 100644
>> --- a/virtio-crypto.tex
>> +++ b/virtio-crypto.tex
>> @@ -41,6 +41,7 @@ \subsection{Feature bits}\label{sec:Device Types / Cry=
pto Device / Feature bits}
>>     supported by the AEAD service.
>> \end{description}
>>=20
>> +Currently, ASYM service do not support stateless mode.
>>=20
>> \subsubsection{Feature bit requirements}\label{sec:Device Types / Crypto=
 Device / Feature bit requirements}
>>=20
>=20
> Drop Currently here pls.


Done, there  are some issues to discuss here.
I think the ASYM service can support the stateless mode just like other ser=
vices such as AEAD, but I found that the built-in cryptodev backend in QEMU=
 does not support stateless mode for any existing services.
Similarly, the ASYM service in my code does not support stateless too, so t=
his patch does not add stateless mode for ASYM service, maybe I should add =
them in this patch? Or in future patches?

>=20
>> @@ -67,6 +68,8 @@ \subsection{Supported crypto services}\label{sec:Devic=
e Types / Crypto Device /
>> #define VIRTIO_CRYPTO_SERVICE_MAC    2
>> /* AEAD (Authenticated Encryption with Associated Data) service */
>> #define VIRTIO_CRYPTO_SERVICE_AEAD   3
>> +/* ASYM (Asymmetric Key Cipher) service */
>> +#define VIRTIO_CRYPTO_SERVICE_ASYM   4
>> \end{lstlisting}
>>=20
>> The above constants designate bits used to indicate the which of crypto =
services are
>> @@ -181,6 +184,65 @@ \subsubsection{AEAD services}\label{sec:Device Type=
s / Crypto Device / Supported
>> operation requests, see \ref{sec:Device Types / Crypto Device / Device O=
peration / Control Virtqueue / Session operation}.
>> \end{enumerate}
>>=20
>> +\subsection{ASYM services}\label{sec: Device Teypes / Crypto Device / S=
upported crypto services / ASYM services}
>> +
>> +The following ASYM key types are defined:
>> +\begin{lstlisting}
>> +#define VIRTIO_CRYPTO_ASYM_KEY_TYPE_PUBLIC  1
>> +#define VIRTIO_CRYPTO_ASYM_KEY_TYPE_PRIVATE 2
>> +\end{lstlisting}
>> +
>> +The above constants are used to disignate the key types in asymmetric c=
rypto operation requests,
>=20
> typo
>=20
>> +see \ref{sec:Device Types / Crypto Device / Device Operation / Control =
Virtqueue / Session operation}.
>> +
>> +The following ASYM algorithms are defined:
>> +\begin{lstlisting}
>> +#define VIRTIO_CRYPTO_NO_ASYM    0
>> +#define VIRTIO_CRYPTO_ASYM_RSA   1
>> +#define VIRTIO_CRYPTO_ASYM_DSA   2
>> +#define VIRTIO_CRYPTO_ASYM_ECDSA 3
>> +\end{lstlisting}
>> +
>> +The above constants have two usages:
>> +\begin{enumerate}
>> +\item As bit numbers, used to tell the driver which ASYM algorithms
>> +are supported by the device, see \ref{sec:Device Types / Crypto Device =
/ Device configuration layout}.
>> +\item As values, used to disignate the algorithm in asymmetric crypto o=
peration requests,
>=20
> typo
>=20
>> +see \ref{sec:Device Types / Crypto Device / Device Operation / Control =
Virtqueue / Session operation}.
>> +\end{enumerate}
>> +
>> +
>> +For RSA algorithm, the following padding algorithms are defined:
>=20
> the RSA?
>=20
>> +\begin{lstlisting}
>> +#define VIRTIO_CRYPTO_RSA_RAW_PADDING   0
>> +#define VIRTIO_CRYPTO_RSA_PKCS1_PADDING 1
>> +\end{lstlisting}
>> +
>> +For RSA algorithm, the following hash algorithms are defined, which is =
used
>=20
> are used?
>=20
>> +to calculate padding result.
>> +\begin{lstlisting}
>> +#define VIRTIO_CRYPTO_RSA_NO_HASH   0
>> +#define VIRTIO_CRYPTO_RSA_MD2       1
>> +#define VIRTIO_CRYPTO_RSA_MD3       2
>> +#define VIRTIO_CRYPTO_RSA_MD4       3
>> +#define VIRTIO_CRYPTO_RSA_MD5       4
>> +#define VIRTIO_CRYPTO_RSA_SHA1      5
>> +#define VIRTIO_CRYPTO_RSA_SHA256    6
>> +#define VIRTIO_CRYPTO_RSA_SHA384    7
>> +#define VIRTIO_CRYPTO_RSA_SHA512    8
>> +#define VIRTIO_CRYPTO_RSA_SHA224    9
>> +\end{lstlisting}
>> +
>> +For ECC algorithms such as ecdsa, the following curves are defined:
>=20
> ECDSA?
>=20
>> +\begin{lstlisting}
>> +#define VIRTIO_CRYPTO_CURVE_UNKNOWN   0
>> +#define VIRTIO_CRYPTO_CURVE_NIST_P192 1
>> +#define VIRTIO_CRYPTO_CURVE_NIST_P224 2
>> +#define VIRTIO_CRYPTO_CURVE_NIST_P256 3
>> +#define VIRTIO_CRYPTO_CURVE_NIST_P384 4
>> +#define VIRTIO_CRYPTO_CURVE_NIST_P521 5
>> +\end{lstlisting}
>> +
>> \subsection{Device configuration layout}\label{sec:Device Types / Crypto=
 Device / Device configuration layout}
>>=20
>> Crypto device configuration uses the following layout structure:
>> @@ -204,6 +266,7 @@ \subsection{Device configuration layout}\label{sec:D=
evice Types / Crypto Device
>>     le32 reserved;
>>     /* Maximum size of each crypto request's content in bytes */
>>     le64 max_size;
>> +    le32 asym_algo;
>> };
>> \end{lstlisting}
>>=20
>> @@ -323,6 +386,7 @@ \subsubsection{Operation Status}\label{sec:Device Ty=
pes / Crypto Device / Device
>>     VIRTIO_CRYPTO_NOTSUPP =3D 3,
>>     VIRTIO_CRYPTO_INVSESS =3D 4,
>>     VIRTIO_CRYPTO_NOSPC =3D 5,
>> +    VIRTIO_CRYPTO_KEY_REJECTED =3D 6,
>>     VIRTIO_CRYPTO_MAX
>> };
>> \end{lstlisting}
>> @@ -334,6 +398,7 @@ \subsubsection{Operation Status}\label{sec:Device Ty=
pes / Crypto Device / Device
>> \item VIRTIO_CRYPTO_INVSESS: invalid session ID when executing crypto op=
erations.
>> \item VIRTIO_CRYPTO_NOSPC: no free session ID (only when the VIRTIO_CRYP=
TO_F_REVISION_1
>>     feature bit is negotiated).
>> +\item VIRTIO_CRYPTO_KEY_REJECTED: signature verify failed (only when ak=
cipher verify).
>=20
> verification?
>=20
> what is akcipher?
>=20

Abbreviation of asymmetric key cipher, I replaced it with ASYM verification=
 here.
>=20
>=20
>> \item VIRTIO_CRYPTO_ERR: any failure not mentioned above occurs.
>> \end{itemize*}
>>=20
>> @@ -364,6 +429,10 @@ \subsubsection{Control Virtqueue}\label{sec:Device =
Types / Crypto Device / Devic
>>        VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AEAD, 0x02)
>> #define VIRTIO_CRYPTO_AEAD_DESTROY_SESSION \
>>        VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AEAD, 0x03)
>> +#define VIRTIO_CRYPTO_ASYM_CREATE_SESSION \
>> +       VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_ASYM, 0x04)
>> +#define VIRTIO_CRYPTO_ASYM_DESTROY_SESSION \
>> +       VIRTIO_CRYPTO_OPCDE(VIRTIO_CRYPTO_SERVICE_ASYM, 0x05)
>>     le32 opcode;
>>     /* algo should be service-specific algorithms */
>>     le32 algo;
>> @@ -658,7 +727,6 @@ \subsubsection{Control Virtqueue}\label{sec:Device T=
ypes / Crypto Device / Devic
>>=20
>> \field{vlf_len} is the size of the specific structure used.
>>=20
>> -
>> \subparagraph{Session operation: AEAD session}\label{sec:Device Types / =
Crypto Device / Device
>> Operation / Control Virtqueue / Session operation / Session operation: A=
EAD session}
>>=20
>=20
> don't do this in this patch pls.
>=20
>> @@ -690,6 +758,73 @@ \subsubsection{Control Virtqueue}\label{sec:Device =
Types / Crypto Device / Devic
>> The length of \field{key} is specified in \field{key_len} in struct
>> virtio_crypto_aead_create_session_flf.
>>=20
>> +\subparagraph{Session operation: ASYM session}\label{sec:Device Types /=
 Crypto Device / Device
>> +Operation / Control Virtqueue / Session operation / Session operation: =
ASYM session}
>> +
>> +The request of ASYM session could be ASYM algorithms request.
>=20
> meaning? and is it always in a session?

Yes, it is always in a session since this subparagraph describes session op=
eration of 'asymmetric algorithm session=E2=80=99.

For CIPHER service,  there are two types of requests for  corresponding ses=
sion operation (see subparagraph: Session Operation: Symmetric algorithms s=
ession), which is CIPHER session requests and chain algorithms request (cha=
ining CIPHER and HASH/MAC).

The ASYM service could have two types of requests too, ASYM session request=
s and chain algorithms requests too. Because I did not implement the releva=
nt code for ASYM chain session requests, I did not mention it here. Maybe I=
 should add it in this patch?


>=20
>> +The fixed-length and the variable-length parameters of ASYM session req=
uests are as follows:
>> +\begin{lstlisting}
>> +struct virtio_crypto_asym_create_session_flf {
>> +    /* Device read only portion */
>> +
>> +    /* See VIRTIO_CRYPTO_ASYM_* above */
>> +    le32 algo;
>> +    /* See VIRTIO_CRYPTO_ASYM_KEY_TYPE_* above */
>> +    le32 key_type;
>> +    /* length of key */
>> +    le32 key_len;
>> +    /* algothrim specific parameters */
>> +    union {
>> +        struct virtio_crypto_rsa_session_para rsa;
>> +        struct virtio_crypto_ecdsa_session_para ecdsa;
>> +    } u;
>> +};
>> +
>> +struct virtio_crypto_rsa_session_para {
>> +    /* Padding algorithm used for rsa, see VIRTIO_CRYPTO_RSA_* above */
>=20
> RSA?
>=20
>> +    le32 padding_algo;
>> +    /* Hash algorithm used for padding digest, see VIRTIO_CRYPTO_RSA_* =
above */
>> +    le32 hash_algo;
>> +};
>> +
>> +struct virtio_crypto_ecdsa_session_para {
>> +    /* Known elliptic curves, see VIRTIO_CRYPTO_CURVE_* */
>> +    le32 curve_id;
>> +};
>> +
>> +struct virtio_crypto_asym_create_session_vlf {
>> +    /* Device read only portion */
>> +    u8 key[key_len];
>> +};
>> +\end{lstlisting}
>> +
>> +The length of cipher_key is specificed in key_len in the struct virtio_=
asym_session_flf.
>> +The format of asymmetric keys is defined with ASN.1 schema and is encod=
ed by DER format.
>=20
> Is it important that we do it like this?
> If we do we need to link to that spec.
>=20
> But maybe just some bytes in LE format would be enough. No?

Yes, here are the reasons we do it:
1. In cryptographic, word 'integer' usually refer to multiple precision int=
eger (MPI), their length from a few hundred bits to several thousand bits, =
which cannot be simply expressed in LE format.
2. Popular cryptography-related standards, for example pkcs8 and X.509,  al=
so use ASN.1 and DER/BER encoding to define asymmetric keys.
3. The following definition I only used the key part of standards, for exam=
ple, =E2=80=98RsaPublicKey' is just a field in X.509 certificate. The main =
reason is that we cannot get other fields from linux crypto-framework.=20

>=20
>> +
>> +The schema of RSA keys:
>> +\begin{lstlisting}
>> +RsaPrivateKey ::=3D SEQUENCE {
>> +    version     INTEGER
>> +    n           INTEGER
>> +    e           INTEGER
>> +    d           INTEGER
>> +    p           INTEGER
>> +    q           INTEGER
>> +    e1          INTEGER
>> +    e2          INTEGER
>> +    u           INTEGER
>> +}
>> +
>> +RsaPublicKey ::=3D SEQUENCE {
>> +    n           INTEGER
>> +    e           INTEGER
>> +}
>> +\end{lstlisting}
>> +
>> +The schema of other algothrim currently undefined.
>=20
> meaning?

This patch introduces ASYM service, but only defines the key format of the =
RSA algorithm, maybe I should add the key format for the ECDSA  algorithm (=
the same as before, the main reason is that I did not implement ends in my =
code)
>=20
>> +
>> +The length of \field{key} is specified in \field{key_len} in struct
>> +virtio_crypto_asym_create_session_flf.
>>=20
>> \drivernormative{\subparagraph}{Session operation: create session}{Devic=
e Types / Crypto Device / Device
>> Operation / Control Virtqueue / Session operation / Session operation: c=
reate session}
>> @@ -764,6 +899,14 @@ \subsubsection{Data Virtqueue}\label{sec:Device Typ=
es / Crypto Device / Device O
>>     VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AEAD, 0x00)
>> #define VIRTIO_CRYPTO_AEAD_DECRYPT \
>>     VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AEAD, 0x01)
>> +#define VIRTIO_CRYPTO_ASYM_ENCRYPT \
>> +    VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_ASYM, 0x00)
>> +#define VIRTIO_CRYPTO_ASYM_DECRYPT \
>> +    VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_ASYM, 0x01)
>> +#define VIRTIO_CRYPTO_ASYM_SIGN \
>> +    VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_ASYM, 0x02)
>> +#define VIRTIO_CRYPTO_ASYM_VERIFY \
>> +    VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_ASYM, 0x03)
>>     le32 opcode;
>>     /* algo should be service-specific algorithms */
>>     le32 algo;
>> @@ -1044,7 +1187,7 @@ \subsubsection{MAC Service Operation}\label{sec:De=
vice Types / Crypto Device / D
>> \begin{itemize*}
>> \item If the VIRTIO_CRYPTO_F_MAC_STATELESS_MODE feature bit is negotiate=
d, the device
>>     MUST parse \field{flag} field in struct virtio_crypto_op_header in o=
rder to decide
>> -=09which mode the driver uses.
>> +    which mode the driver uses.
>> \item The device MUST copy the results of MAC operations in the hash_res=
ult[] if HASH
>>     operations success.
>> \item The device MUST set \field{status} in struct virtio_crypto_inhdr t=
o one of the
>=20
>=20
> don't do it in this patch pls.
>=20
>> @@ -1369,7 +1512,7 @@ \subsubsection{Symmetric algorithms Operation}\lab=
el{sec:Device Types / Crypto D
>> \begin{itemize*}
>> \item If the VIRTIO_CRYPTO_F_CIPHER_STATELESS_MODE feature bit is negoti=
ated, the device
>>     MUST parse \field{flag} field in struct virtio_crypto_op_header in o=
rder to decide
>> -=09which mode the driver uses.
>> +    which mode the driver uses.
>> \item The device MUST parse the virtio_crypto_sym_data_req based on the =
\field{opcode}
>>     field in general header.
>> \item The device MUST parse the fields of struct virtio_crypto_cipher_da=
ta_flf in
>=20
> same
>=20
>> @@ -1518,7 +1661,7 @@ \subsubsection{AEAD Service Operation}\label{sec:D=
evice Types / Crypto Device /
>> \begin{itemize*}
>> \item If the VIRTIO_CRYPTO_F_AEAD_STATELESS_MODE feature bit is negotiat=
ed, the
>>     device MUST parse the virtio_crypto_aead_data_vlf_stateless based on=
 the \field{opcode}
>> -=09field in general header.
>> +    field in general header.
>> \item The device MUST copy the result of cryptographic operation in the =
dst_data[].
>> \item The device MUST copy the authentication tag in the dst_data[] offs=
et the cipher result.
>> \item The device MUST set the \field{status} field in struct virtio_cryp=
to_inhdr to
>=20
> same
>=20
>> @@ -1533,3 +1676,66 @@ \subsubsection{AEAD Service Operation}\label{sec:=
Device Types / Crypto Device /
>> \item VIRTIO_CRYPTO_ERR if any failure not mentioned above occurs.
>> \end{itemize*}
>> \end{itemize*}
>> +
>> +\subsubsection{ASYM Service Operation}\label{sec:Device Types / Crypto =
Device / Device Operation / ASYM Service Operation}
>> +
>> +Session mode requests of asymmetric algorithm are as follows:
>=20
>=20
> the asymmetric?
>=20
>> +
>> +\begin{lstlisting}
>> +struct virtio_crypto_asym_data_flf {
>> +    /*
>> +     * For Encrypt/Decrypt/Sign, src data is the plaintext/ciphertext/d=
igest,
>> +     * and dst data is the ciphertext/plaintext/digest.
>> +     * For verify, src data is signature, and dst data is the digest.
>=20
> Verify? the signature?
>=20
>> +     */
>> +    /* length of source data */
>> +    le32 src_data_len;
>> +    /* length of dst data */
>> +    le32 dst_data_len;
>> +};
>> +
>> +struct virtio_crypto_asym_data_vlf {
>> +    /* Device read only portion */
>> +
>> +    /*
>> +     * For Encrypt/Decrypt/Sign, src_data_len equals src_data_len field=
 of struct
>> +     * virtio_crypto_asym_data_flf, dst_data_len equals dst_data_len fi=
eld of struct
>> +     * virtio_crypto_asym_data_flf.
>> +     * For Verify, src_data_len equals the sum of src_data_len and dst_=
data_len in
>> +     * struct virtio_crypto_asym_data_flf. and dst_data_len always equa=
ls zero.
>=20
> no .?
>=20
>> +     */
>> +    /* Source data */
>> +    u8 src_data[src_data_len];
>> +
>> +    /* Device write only portion */
>> +    /* Pointer to output data */
>> +    u8 dst_data[dst_data_len];
>> +};
>> +\end{lstlisting}
>> +
>> +\drivernormative{\paragraph}{ASYM Service Operation}{Device Types / Cry=
pto Device / Device Operation / ASYM Service Operation}
>> +
>> +\begin{itemize*}
>> +\item The driver MUST set \field{session_id} in struct virtio_crypto_op=
_header to a valid value assigned
>> +    by the device when the session was created.
>> +\item The driver MUST set the \field{opcode} field in struct virtio_cry=
pto_op_header
>> +    to one of VIRTIO_CRYPTO_ASYM_ENCRYPT, VIRTIO_CRYPTO_ASYM_DESTROY_SE=
SSION, VIRTIO_CRYPTO_ASYM_SIGN and VIRTIO_CRYPTO_ASYM_VERIFY.
>> +\end{itemize*}
>> +
>> +\devicenormative{\paragraph}{ASYM Service Operation}{Device Types / Cry=
pto Device / Device Operation / ASYM Service Operation}
>> +
>> +\begin{itemize*}
>> +\item The device MUST parse the virtio_crypto_aead_data_vlf_stateless b=
ased on the \field{opcode}
>> +    field in general header.
>> +\item The device MUST copy the result of cryptographic operation in the=
 dst_data[].
>> +\item The device MUST set the \field{status} field in struct virtio_cry=
pto_inhdr to
>> +    one of the following values of enum VIRTIO_CRYPTO_STATUS:
>> +\begin{itemize*}
>> +\item VIRTIO_CRYPTO_OK if the operation success.
>> +\item VIRTIO_CRYPTO_NOTSUPP if the requested algorithm or operation is =
unsupported.
>> +\item VIRTIO_CRYPTO_BADMSG if the verification result is incorrect.
>> +\item VIRTIO_CRYPTO_INVSESS if the session ID invalid when in session m=
ode.
>> +\item VIRTIO_CRYPTO_KEY_REJECTED if the signature verification failed.
>> +\item VIRTIO_CRYPTO_ERR if any failure not mentioned above occurs.
>> +\end{itemize*}
>> +\end{itemize*}
>> --=20
>> 2.11.0


--Apple-Mail=_78058476-023A-46DB-ACAE-372BBAD41DC3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8"></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: s=
pace; line-break: after-white-space;" class=3D""><div class=3D"">Glad to re=
ceive the reply and thank you for the review. I fixed the typos and grammat=
ical errors.&nbsp;</div><div class=3D"">I have responded some questions bel=
ow, and will provide v2 patch as soon as possible.</div><div class=3D""><br=
 class=3D""></div><div><br class=3D""><blockquote type=3D"cite" class=3D"">=
<div class=3D"">On Nov 4, 2021, at 8:14 PM, Michael S. Tsirkin &lt;<a href=
=3D"mailto:mst@redhat.com" class=3D"">mst@redhat.com</a>&gt; wrote:</div><b=
r class=3D"Apple-interchange-newline"><div class=3D""><span style=3D"caret-=
color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: n=
ormal; font-variant-caps: normal; font-weight: normal; letter-spacing: norm=
al; text-align: start; text-indent: 0px; text-transform: none; white-space:=
 normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration=
: none; float: none; display: inline !important;" class=3D"">On Mon, Oct 25=
, 2021 at 11:30:45AM +0800, Lei He wrote:</span><br style=3D"caret-color: r=
gb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; f=
ont-variant-caps: normal; font-weight: normal; letter-spacing: normal; text=
-align: start; text-indent: 0px; text-transform: none; white-space: normal;=
 word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;"=
 class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; font=
-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: no=
rmal; letter-spacing: normal; orphans: auto; text-align: start; text-indent=
: 0px; text-transform: none; white-space: normal; widows: auto; word-spacin=
g: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; tex=
t-decoration: none;" class=3D"">Introduce asym service type, several asymme=
tric algorithms and<br class=3D"">relevent information:<br class=3D"">&nbsp=
;- RSA(padding algorithm, ASN.1 schema definition)<br class=3D"">&nbsp;- DS=
A<br class=3D"">&nbsp;- ECDSA(ecc algorithm)<br class=3D""><br class=3D"">S=
igned-off-by: zhenwei pi &lt;<a href=3D"mailto:pizhenwei@bytedance.com" cla=
ss=3D"">pizhenwei@bytedance.com</a>&gt;<br class=3D"">Signed-off-by: Lei He=
 &lt;<a href=3D"mailto:helei.sig11@bytedance.com" class=3D"">helei.sig11@by=
tedance.com</a>&gt;<br class=3D"">---<br class=3D"">virtio-crypto.tex | 214=
 +++++++++++++++++++++++++++++++++++++++++++++++++++++-<br class=3D"">1 fil=
e changed, 210 insertions(+), 4 deletions(-)<br class=3D""><br class=3D"">d=
iff --git a/virtio-crypto.tex b/virtio-crypto.tex<br class=3D"">index 74746=
f9..53339a1 100644<br class=3D"">--- a/virtio-crypto.tex<br class=3D"">+++ =
b/virtio-crypto.tex<br class=3D"">@@ -41,6 +41,7 @@ \subsection{Feature bit=
s}\label{sec:Device Types / Crypto Device / Feature bits}<br class=3D"">&nb=
sp;&nbsp;&nbsp;&nbsp;supported by the AEAD service.<br class=3D"">\end{desc=
ription}<br class=3D""><br class=3D"">+Currently, ASYM service do not suppo=
rt stateless mode.<br class=3D""><br class=3D"">\subsubsection{Feature bit =
requirements}\label{sec:Device Types / Crypto Device / Feature bit requirem=
ents}<br class=3D""><br class=3D""></blockquote><br style=3D"caret-color: r=
gb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; f=
ont-variant-caps: normal; font-weight: normal; letter-spacing: normal; text=
-align: start; text-indent: 0px; text-transform: none; white-space: normal;=
 word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;"=
 class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetic=
a; font-size: 12px; font-style: normal; font-variant-caps: normal; font-wei=
ght: normal; letter-spacing: normal; text-align: start; text-indent: 0px; t=
ext-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-s=
troke-width: 0px; text-decoration: none; float: none; display: inline !impo=
rtant;" class=3D"">Drop Currently here pls.</span><br style=3D"caret-color:=
 rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal;=
 font-variant-caps: normal; font-weight: normal; letter-spacing: normal; te=
xt-align: start; text-indent: 0px; text-transform: none; white-space: norma=
l; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none=
;" class=3D""></div></blockquote><div><br class=3D""><div class=3D""><br cl=
ass=3D""></div></div>Done, there &nbsp;are some issues to discuss here.</di=
v><div>I think the ASYM service can support the stateless mode just like ot=
her services such as AEAD, but I found that the built-in cryptodev backend =
in QEMU does not support stateless mode for any existing services.</div><di=
v>Similarly, the ASYM service in my code does not support stateless too, so=
 this patch does not add stateless mode for ASYM service, maybe I should ad=
d them in this patch? Or in future patches?</div><div><br class=3D""></div>=
<div><blockquote type=3D"cite" class=3D""><div class=3D""><br style=3D"care=
t-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style:=
 normal; font-variant-caps: normal; font-weight: normal; letter-spacing: no=
rmal; text-align: start; text-indent: 0px; text-transform: none; white-spac=
e: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decorati=
on: none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: Helve=
tica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-=
weight: normal; letter-spacing: normal; orphans: auto; text-align: start; t=
ext-indent: 0px; text-transform: none; white-space: normal; widows: auto; w=
ord-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width=
: 0px; text-decoration: none;" class=3D"">@@ -67,6 +68,8 @@ \subsection{Sup=
ported crypto services}\label{sec:Device Types / Crypto Device /<br class=
=3D"">#define VIRTIO_CRYPTO_SERVICE_MAC &nbsp;&nbsp;&nbsp;2<br class=3D"">/=
* AEAD (Authenticated Encryption with Associated Data) service */<br class=
=3D"">#define VIRTIO_CRYPTO_SERVICE_AEAD &nbsp;&nbsp;3<br class=3D"">+/* AS=
YM (Asymmetric Key Cipher) service */<br class=3D"">+#define VIRTIO_CRYPTO_=
SERVICE_ASYM &nbsp;&nbsp;4<br class=3D"">\end{lstlisting}<br class=3D""><br=
 class=3D"">The above constants designate bits used to indicate the which o=
f crypto services are<br class=3D"">@@ -181,6 +184,65 @@ \subsubsection{AEA=
D services}\label{sec:Device Types / Crypto Device / Supported<br class=3D"=
">operation requests, see \ref{sec:Device Types / Crypto Device / Device Op=
eration / Control Virtqueue / Session operation}.<br class=3D"">\end{enumer=
ate}<br class=3D""><br class=3D"">+\subsection{ASYM services}\label{sec: De=
vice Teypes / Crypto Device / Supported crypto services / ASYM services}<br=
 class=3D"">+<br class=3D"">+The following ASYM key types are defined:<br c=
lass=3D"">+\begin{lstlisting}<br class=3D"">+#define VIRTIO_CRYPTO_ASYM_KEY=
_TYPE_PUBLIC &nbsp;1<br class=3D"">+#define VIRTIO_CRYPTO_ASYM_KEY_TYPE_PRI=
VATE 2<br class=3D"">+\end{lstlisting}<br class=3D"">+<br class=3D"">+The a=
bove constants are used to disignate the key types in asymmetric crypto ope=
ration requests,<br class=3D""></blockquote><br style=3D"caret-color: rgb(0=
, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-=
variant-caps: normal; font-weight: normal; letter-spacing: normal; text-ali=
gn: start; text-indent: 0px; text-transform: none; white-space: normal; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" cla=
ss=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; f=
ont-size: 12px; font-style: normal; font-variant-caps: normal; font-weight:=
 normal; letter-spacing: normal; text-align: start; text-indent: 0px; text-=
transform: none; white-space: normal; word-spacing: 0px; -webkit-text-strok=
e-width: 0px; text-decoration: none; float: none; display: inline !importan=
t;" class=3D"">typo</span><br style=3D"caret-color: rgb(0, 0, 0); font-fami=
ly: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: norm=
al; font-weight: normal; letter-spacing: normal; text-align: start; text-in=
dent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -w=
ebkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br style=
=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; fon=
t-style: normal; font-variant-caps: normal; font-weight: normal; letter-spa=
cing: normal; text-align: start; text-indent: 0px; text-transform: none; wh=
ite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-=
decoration: none;" class=3D""><blockquote type=3D"cite" style=3D"font-famil=
y: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: norma=
l; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; widows:=
 auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stro=
ke-width: 0px; text-decoration: none;" class=3D"">+see \ref{sec:Device Type=
s / Crypto Device / Device Operation / Control Virtqueue / Session operatio=
n}.<br class=3D"">+<br class=3D"">+The following ASYM algorithms are define=
d:<br class=3D"">+\begin{lstlisting}<br class=3D"">+#define VIRTIO_CRYPTO_N=
O_ASYM &nbsp;&nbsp;&nbsp;0<br class=3D"">+#define VIRTIO_CRYPTO_ASYM_RSA &n=
bsp;&nbsp;1<br class=3D"">+#define VIRTIO_CRYPTO_ASYM_DSA &nbsp;&nbsp;2<br =
class=3D"">+#define VIRTIO_CRYPTO_ASYM_ECDSA 3<br class=3D"">+\end{lstlisti=
ng}<br class=3D"">+<br class=3D"">+The above constants have two usages:<br =
class=3D"">+\begin{enumerate}<br class=3D"">+\item As bit numbers, used to =
tell the driver which ASYM algorithms<br class=3D"">+are supported by the d=
evice, see \ref{sec:Device Types / Crypto Device / Device configuration lay=
out}.<br class=3D"">+\item As values, used to disignate the algorithm in as=
ymmetric crypto operation requests,<br class=3D""></blockquote><br style=3D=
"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-s=
tyle: normal; font-variant-caps: normal; font-weight: normal; letter-spacin=
g: normal; text-align: start; text-indent: 0px; text-transform: none; white=
-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-dec=
oration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-f=
amily: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: n=
ormal; font-weight: normal; letter-spacing: normal; text-align: start; text=
-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;=
 -webkit-text-stroke-width: 0px; text-decoration: none; float: none; displa=
y: inline !important;" class=3D"">typo</span><br style=3D"caret-color: rgb(=
0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font=
-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-al=
ign: start; text-indent: 0px; text-transform: none; white-space: normal; wo=
rd-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" cl=
ass=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; fo=
nt-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; text-t=
ransform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke=
-width: 0px; text-decoration: none;" class=3D""><blockquote type=3D"cite" s=
tyle=3D"font-family: Helvetica; font-size: 12px; font-style: normal; font-v=
ariant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: =
auto; text-align: start; text-indent: 0px; text-transform: none; white-spac=
e: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto;=
 -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">+see \r=
ef{sec:Device Types / Crypto Device / Device Operation / Control Virtqueue =
/ Session operation}.<br class=3D"">+\end{enumerate}<br class=3D"">+<br cla=
ss=3D"">+<br class=3D"">+For RSA algorithm, the following padding algorithm=
s are defined:<br class=3D""></blockquote><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-va=
riant-caps: normal; font-weight: normal; letter-spacing: normal; text-align=
: start; text-indent: 0px; text-transform: none; white-space: normal; word-=
spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=
=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; fon=
t-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: n=
ormal; letter-spacing: normal; text-align: start; text-indent: 0px; text-tr=
ansform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-=
width: 0px; text-decoration: none; float: none; display: inline !important;=
" class=3D"">the RSA?</span><br style=3D"caret-color: rgb(0, 0, 0); font-fa=
mily: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: no=
rmal; font-weight: normal; letter-spacing: normal; text-align: start; text-=
indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br styl=
e=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; fo=
nt-style: normal; font-variant-caps: normal; font-weight: normal; letter-sp=
acing: normal; text-align: start; text-indent: 0px; text-transform: none; w=
hite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text=
-decoration: none;" class=3D""><blockquote type=3D"cite" style=3D"font-fami=
ly: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: norm=
al; font-weight: normal; letter-spacing: normal; orphans: auto; text-align:=
 start; text-indent: 0px; text-transform: none; white-space: normal; widows=
: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-str=
oke-width: 0px; text-decoration: none;" class=3D"">+\begin{lstlisting}<br c=
lass=3D"">+#define VIRTIO_CRYPTO_RSA_RAW_PADDING &nbsp;&nbsp;0<br class=3D"=
">+#define VIRTIO_CRYPTO_RSA_PKCS1_PADDING 1<br class=3D"">+\end{lstlisting=
}<br class=3D"">+<br class=3D"">+For RSA algorithm, the following hash algo=
rithms are defined, which is used<br class=3D""></blockquote><br style=3D"c=
aret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-sty=
le: normal; font-variant-caps: normal; font-weight: normal; letter-spacing:=
 normal; text-align: start; text-indent: 0px; text-transform: none; white-s=
pace: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decor=
ation: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-fam=
ily: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: nor=
mal; font-weight: normal; letter-spacing: normal; text-align: start; text-i=
ndent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -=
webkit-text-stroke-width: 0px; text-decoration: none; float: none; display:=
 inline !important;" class=3D"">are used?</span><br style=3D"caret-color: r=
gb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; f=
ont-variant-caps: normal; font-weight: normal; letter-spacing: normal; text=
-align: start; text-indent: 0px; text-transform: none; white-space: normal;=
 word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;"=
 class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica;=
 font-size: 12px; font-style: normal; font-variant-caps: normal; font-weigh=
t: normal; letter-spacing: normal; text-align: start; text-indent: 0px; tex=
t-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-str=
oke-width: 0px; text-decoration: none;" class=3D""><blockquote type=3D"cite=
" style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; fon=
t-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphan=
s: auto; text-align: start; text-indent: 0px; text-transform: none; white-s=
pace: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: au=
to; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">+to =
calculate padding result.<br class=3D"">+\begin{lstlisting}<br class=3D"">+=
#define VIRTIO_CRYPTO_RSA_NO_HASH &nbsp;&nbsp;0<br class=3D"">+#define VIRT=
IO_CRYPTO_RSA_MD2 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1<br class=3D"">+#def=
ine VIRTIO_CRYPTO_RSA_MD3 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2<br class=3D=
"">+#define VIRTIO_CRYPTO_RSA_MD4 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3<br =
class=3D"">+#define VIRTIO_CRYPTO_RSA_MD5 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;4<br class=3D"">+#define VIRTIO_CRYPTO_RSA_SHA1 &nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;5<br class=3D"">+#define VIRTIO_CRYPTO_RSA_SHA256 &nbsp;&nbsp;&nbsp;6=
<br class=3D"">+#define VIRTIO_CRYPTO_RSA_SHA384 &nbsp;&nbsp;&nbsp;7<br cla=
ss=3D"">+#define VIRTIO_CRYPTO_RSA_SHA512 &nbsp;&nbsp;&nbsp;8<br class=3D""=
>+#define VIRTIO_CRYPTO_RSA_SHA224 &nbsp;&nbsp;&nbsp;9<br class=3D"">+\end{=
lstlisting}<br class=3D"">+<br class=3D"">+For ECC algorithms such as ecdsa=
, the following curves are defined:<br class=3D""></blockquote><br style=3D=
"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-s=
tyle: normal; font-variant-caps: normal; font-weight: normal; letter-spacin=
g: normal; text-align: start; text-indent: 0px; text-transform: none; white=
-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-dec=
oration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-f=
amily: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: n=
ormal; font-weight: normal; letter-spacing: normal; text-align: start; text=
-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;=
 -webkit-text-stroke-width: 0px; text-decoration: none; float: none; displa=
y: inline !important;" class=3D"">ECDSA?</span><br style=3D"caret-color: rg=
b(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; fo=
nt-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-=
align: start; text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight=
: normal; letter-spacing: normal; text-align: start; text-indent: 0px; text=
-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stro=
ke-width: 0px; text-decoration: none;" class=3D""><blockquote type=3D"cite"=
 style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; font=
-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans=
: auto; text-align: start; text-indent: 0px; text-transform: none; white-sp=
ace: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: aut=
o; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">+\beg=
in{lstlisting}<br class=3D"">+#define VIRTIO_CRYPTO_CURVE_UNKNOWN &nbsp;&nb=
sp;0<br class=3D"">+#define VIRTIO_CRYPTO_CURVE_NIST_P192 1<br class=3D"">+=
#define VIRTIO_CRYPTO_CURVE_NIST_P224 2<br class=3D"">+#define VIRTIO_CRYPT=
O_CURVE_NIST_P256 3<br class=3D"">+#define VIRTIO_CRYPTO_CURVE_NIST_P384 4<=
br class=3D"">+#define VIRTIO_CRYPTO_CURVE_NIST_P521 5<br class=3D"">+\end{=
lstlisting}<br class=3D"">+<br class=3D"">\subsection{Device configuration =
layout}\label{sec:Device Types / Crypto Device / Device configuration layou=
t}<br class=3D""><br class=3D"">Crypto device configuration uses the follow=
ing layout structure:<br class=3D"">@@ -204,6 +266,7 @@ \subsection{Device =
configuration layout}\label{sec:Device Types / Crypto Device<br class=3D"">=
&nbsp;&nbsp;&nbsp;&nbsp;le32 reserved;<br class=3D"">&nbsp;&nbsp;&nbsp;&nbs=
p;/* Maximum size of each crypto request's content in bytes */<br class=3D"=
">&nbsp;&nbsp;&nbsp;&nbsp;le64 max_size;<br class=3D"">+ &nbsp;&nbsp;&nbsp;=
le32 asym_algo;<br class=3D"">};<br class=3D"">\end{lstlisting}<br class=3D=
""><br class=3D"">@@ -323,6 +386,7 @@ \subsubsection{Operation Status}\labe=
l{sec:Device Types / Crypto Device / Device<br class=3D"">&nbsp;&nbsp;&nbsp=
;&nbsp;VIRTIO_CRYPTO_NOTSUPP =3D 3,<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;V=
IRTIO_CRYPTO_INVSESS =3D 4,<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;VIRTIO_CR=
YPTO_NOSPC =3D 5,<br class=3D"">+ &nbsp;&nbsp;&nbsp;VIRTIO_CRYPTO_KEY_REJEC=
TED =3D 6,<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;VIRTIO_CRYPTO_MAX<br class=
=3D"">};<br class=3D"">\end{lstlisting}<br class=3D"">@@ -334,6 +398,7 @@ \=
subsubsection{Operation Status}\label{sec:Device Types / Crypto Device / De=
vice<br class=3D"">\item VIRTIO_CRYPTO_INVSESS: invalid session ID when exe=
cuting crypto operations.<br class=3D"">\item VIRTIO_CRYPTO_NOSPC: no free =
session ID (only when the VIRTIO_CRYPTO_F_REVISION_1<br class=3D"">&nbsp;&n=
bsp;&nbsp;&nbsp;feature bit is negotiated).<br class=3D"">+\item VIRTIO_CRY=
PTO_KEY_REJECTED: signature verify failed (only when akcipher verify).<br c=
lass=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); font-family:=
 Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal;=
 font-weight: normal; letter-spacing: normal; text-align: start; text-inden=
t: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webk=
it-text-stroke-width: 0px; text-decoration: none;" class=3D""><span style=
=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; fon=
t-style: normal; font-variant-caps: normal; font-weight: normal; letter-spa=
cing: normal; text-align: start; text-indent: 0px; text-transform: none; wh=
ite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-=
decoration: none; float: none; display: inline !important;" class=3D"">veri=
fication?</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvet=
ica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-w=
eight: normal; letter-spacing: normal; text-align: start; text-indent: 0px;=
 text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text=
-stroke-width: 0px; text-decoration: none;" class=3D""><br style=3D"caret-c=
olor: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: no=
rmal; font-variant-caps: normal; font-weight: normal; letter-spacing: norma=
l; text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration:=
 none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: H=
elvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; f=
ont-weight: normal; letter-spacing: normal; text-align: start; text-indent:=
 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit=
-text-stroke-width: 0px; text-decoration: none; float: none; display: inlin=
e !important;" class=3D"">what is akcipher?</span><br style=3D"caret-color:=
 rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal;=
 font-variant-caps: normal; font-weight: normal; letter-spacing: normal; te=
xt-align: start; text-indent: 0px; text-transform: none; white-space: norma=
l; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none=
;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetic=
a; font-size: 12px; font-style: normal; font-variant-caps: normal; font-wei=
ght: normal; letter-spacing: normal; text-align: start; text-indent: 0px; t=
ext-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-s=
troke-width: 0px; text-decoration: none;" class=3D""></div></blockquote><di=
v><div class=3D""><br class=3D""></div></div>Abbreviation of asymmetric key=
 cipher, I replaced it with ASYM verification here.<br class=3D""><blockquo=
te type=3D"cite" class=3D""><div class=3D""><br style=3D"caret-color: rgb(0=
, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-=
variant-caps: normal; font-weight: normal; letter-spacing: normal; text-ali=
gn: start; text-indent: 0px; text-transform: none; white-space: normal; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" cla=
ss=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; fon=
t-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: n=
ormal; letter-spacing: normal; text-align: start; text-indent: 0px; text-tr=
ansform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-=
width: 0px; text-decoration: none;" class=3D""><blockquote type=3D"cite" st=
yle=3D"font-family: Helvetica; font-size: 12px; font-style: normal; font-va=
riant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: a=
uto; text-align: start; text-indent: 0px; text-transform: none; white-space=
: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">\item VI=
RTIO_CRYPTO_ERR: any failure not mentioned above occurs.<br class=3D"">\end=
{itemize*}<br class=3D""><br class=3D"">@@ -364,6 +429,10 @@ \subsubsection=
{Control Virtqueue}\label{sec:Device Types / Crypto Device / Devic<br class=
=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VIRTIO_CRYPTO_OPCODE(VIRTIO=
_CRYPTO_SERVICE_AEAD, 0x02)<br class=3D"">#define VIRTIO_CRYPTO_AEAD_DESTRO=
Y_SESSION \<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VIRTIO_=
CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AEAD, 0x03)<br class=3D"">+#define VIRT=
IO_CRYPTO_ASYM_CREATE_SESSION \<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_ASYM, 0x04)<br class=3D=
"">+#define VIRTIO_CRYPTO_ASYM_DESTROY_SESSION \<br class=3D"">+ &nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;VIRTIO_CRYPTO_OPCDE(VIRTIO_CRYPTO_SERVICE_ASYM, 0=
x05)<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;le32 opcode;<br class=3D"">&nbsp=
;&nbsp;&nbsp;&nbsp;/* algo should be service-specific algorithms */<br clas=
s=3D"">&nbsp;&nbsp;&nbsp;&nbsp;le32 algo;<br class=3D"">@@ -658,7 +727,6 @@=
 \subsubsection{Control Virtqueue}\label{sec:Device Types / Crypto Device /=
 Devic<br class=3D""><br class=3D"">\field{vlf_len} is the size of the spec=
ific structure used.<br class=3D""><br class=3D"">-<br class=3D"">\subparag=
raph{Session operation: AEAD session}\label{sec:Device Types / Crypto Devic=
e / Device<br class=3D"">Operation / Control Virtqueue / Session operation =
/ Session operation: AEAD session}<br class=3D""><br class=3D""></blockquot=
e><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0,=
 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-v=
ariant-caps: normal; font-weight: normal; letter-spacing: normal; text-alig=
n: start; text-indent: 0px; text-transform: none; white-space: normal; word=
-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float=
: none; display: inline !important;" class=3D"">don't do this in this patch=
 pls.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica;=
 font-size: 12px; font-style: normal; font-variant-caps: normal; font-weigh=
t: normal; letter-spacing: normal; text-align: start; text-indent: 0px; tex=
t-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-str=
oke-width: 0px; text-decoration: none;" class=3D""><br style=3D"caret-color=
: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal=
; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; t=
ext-align: start; text-indent: 0px; text-transform: none; white-space: norm=
al; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: non=
e;" class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; f=
ont-size: 12px; font-style: normal; font-variant-caps: normal; font-weight:=
 normal; letter-spacing: normal; orphans: auto; text-align: start; text-ind=
ent: 0px; text-transform: none; white-space: normal; widows: auto; word-spa=
cing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">@@ -690,6 +758,73 @@ \subsubsection{Cont=
rol Virtqueue}\label{sec:Device Types / Crypto Device / Devic<br class=3D""=
>The length of \field{key} is specified in \field{key_len} in struct<br cla=
ss=3D"">virtio_crypto_aead_create_session_flf.<br class=3D""><br class=3D""=
>+\subparagraph{Session operation: ASYM session}\label{sec:Device Types / C=
rypto Device / Device<br class=3D"">+Operation / Control Virtqueue / Sessio=
n operation / Session operation: ASYM session}<br class=3D"">+<br class=3D"=
">+The request of ASYM session could be ASYM algorithms request.<br class=
=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); font-family: Hel=
vetica; font-size: 12px; font-style: normal; font-variant-caps: normal; fon=
t-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0=
px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-t=
ext-stroke-width: 0px; text-decoration: none;" class=3D""><span style=3D"ca=
ret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-styl=
e: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; white-sp=
ace: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decora=
tion: none; float: none; display: inline !important;" class=3D"">meaning? a=
nd is it always in a session?</span><br style=3D"caret-color: rgb(0, 0, 0);=
 font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-=
caps: normal; font-weight: normal; letter-spacing: normal; text-align: star=
t; text-indent: 0px; text-transform: none; white-space: normal; word-spacin=
g: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">=
</div></blockquote><div><br class=3D""></div>Yes, it is always in a session=
 since this subparagraph describes session operation of 'asymmetric algorit=
hm session=E2=80=99.</div><div><br class=3D""></div><div style=3D"orphans: =
2; widows: 2;">For CIPHER service, &nbsp;there are two types of requests fo=
r &nbsp;corresponding session operation (see subparagraph: Session Operatio=
n: Symmetric algorithms session), which is CIPHER session requests and chai=
n algorithms request (chaining CIPHER and HASH/MAC).</div><div style=3D"orp=
hans: 2; widows: 2;"><br class=3D""></div><div style=3D"orphans: 2; widows:=
 2;">The ASYM service could have two types of requests too, ASYM session re=
quests and chain algorithms requests too. Because I did not implement the r=
elevant code for ASYM chain session requests, I did not mention it here. Ma=
ybe I should add it in this patch?</div><div class=3D""><br class=3D""></di=
v><div><br class=3D""></div><div><blockquote type=3D"cite" class=3D""><div =
class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight=
: normal; letter-spacing: normal; text-align: start; text-indent: 0px; text=
-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stro=
ke-width: 0px; text-decoration: none;" class=3D""><blockquote type=3D"cite"=
 style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; font=
-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans=
: auto; text-align: start; text-indent: 0px; text-transform: none; white-sp=
ace: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: aut=
o; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">+The =
fixed-length and the variable-length parameters of ASYM session requests ar=
e as follows:<br class=3D"">+\begin{lstlisting}<br class=3D"">+struct virti=
o_crypto_asym_create_session_flf {<br class=3D"">+ &nbsp;&nbsp;&nbsp;/* Dev=
ice read only portion */<br class=3D"">+<br class=3D"">+ &nbsp;&nbsp;&nbsp;=
/* See VIRTIO_CRYPTO_ASYM_* above */<br class=3D"">+ &nbsp;&nbsp;&nbsp;le32=
 algo;<br class=3D"">+ &nbsp;&nbsp;&nbsp;/* See VIRTIO_CRYPTO_ASYM_KEY_TYPE=
_* above */<br class=3D"">+ &nbsp;&nbsp;&nbsp;le32 key_type;<br class=3D"">=
+ &nbsp;&nbsp;&nbsp;/* length of key */<br class=3D"">+ &nbsp;&nbsp;&nbsp;l=
e32 key_len;<br class=3D"">+ &nbsp;&nbsp;&nbsp;/* algothrim specific parame=
ters */<br class=3D"">+ &nbsp;&nbsp;&nbsp;union {<br class=3D"">+ &nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;struct virtio_crypto_rsa_session_para rsa;=
<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;struct virtio_cr=
ypto_ecdsa_session_para ecdsa;<br class=3D"">+ &nbsp;&nbsp;&nbsp;} u;<br cl=
ass=3D"">+};<br class=3D"">+<br class=3D"">+struct virtio_crypto_rsa_sessio=
n_para {<br class=3D"">+ &nbsp;&nbsp;&nbsp;/* Padding algorithm used for rs=
a, see VIRTIO_CRYPTO_RSA_* above */<br class=3D""></blockquote><br style=3D=
"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-s=
tyle: normal; font-variant-caps: normal; font-weight: normal; letter-spacin=
g: normal; text-align: start; text-indent: 0px; text-transform: none; white=
-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-dec=
oration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-f=
amily: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: n=
ormal; font-weight: normal; letter-spacing: normal; text-align: start; text=
-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;=
 -webkit-text-stroke-width: 0px; text-decoration: none; float: none; displa=
y: inline !important;" class=3D"">RSA?</span><br style=3D"caret-color: rgb(=
0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font=
-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-al=
ign: start; text-indent: 0px; text-transform: none; white-space: normal; wo=
rd-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" cl=
ass=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; fo=
nt-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; text-t=
ransform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke=
-width: 0px; text-decoration: none;" class=3D""><blockquote type=3D"cite" s=
tyle=3D"font-family: Helvetica; font-size: 12px; font-style: normal; font-v=
ariant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: =
auto; text-align: start; text-indent: 0px; text-transform: none; white-spac=
e: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto;=
 -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">+ &nbsp=
;&nbsp;&nbsp;le32 padding_algo;<br class=3D"">+ &nbsp;&nbsp;&nbsp;/* Hash a=
lgorithm used for padding digest, see VIRTIO_CRYPTO_RSA_* above */<br class=
=3D"">+ &nbsp;&nbsp;&nbsp;le32 hash_algo;<br class=3D"">+};<br class=3D"">+=
<br class=3D"">+struct virtio_crypto_ecdsa_session_para {<br class=3D"">+ &=
nbsp;&nbsp;&nbsp;/* Known elliptic curves, see VIRTIO_CRYPTO_CURVE_* */<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;le32 curve_id;<br class=3D"">+};<br class=3D=
"">+<br class=3D"">+struct virtio_crypto_asym_create_session_vlf {<br class=
=3D"">+ &nbsp;&nbsp;&nbsp;/* Device read only portion */<br class=3D"">+ &n=
bsp;&nbsp;&nbsp;u8 key[key_len];<br class=3D"">+};<br class=3D"">+\end{lstl=
isting}<br class=3D"">+<br class=3D"">+The length of cipher_key is specific=
ed in key_len in the struct virtio_asym_session_flf.<br class=3D"">+The for=
mat of asymmetric keys is defined with ASN.1 schema and is encoded by DER f=
ormat.<br class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); f=
ont-family: Helvetica; font-size: 12px; font-style: normal; font-variant-ca=
ps: normal; font-weight: normal; letter-spacing: normal; text-align: start;=
 text-indent: 0px; text-transform: none; white-space: normal; word-spacing:=
 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><s=
pan style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none; float: none; display: inline !important;" class=
=3D"">Is it important that we do it like this?</span><br style=3D"caret-col=
or: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: norm=
al; font-variant-caps: normal; font-weight: normal; letter-spacing: normal;=
 text-align: start; text-indent: 0px; text-transform: none; white-space: no=
rmal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: n=
one;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Hel=
vetica; font-size: 12px; font-style: normal; font-variant-caps: normal; fon=
t-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0=
px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-t=
ext-stroke-width: 0px; text-decoration: none; float: none; display: inline =
!important;" class=3D"">If we do we need to link to that spec.</span><br st=
yle=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; letter-=
spacing: normal; text-align: start; text-indent: 0px; text-transform: none;=
 white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; te=
xt-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); fo=
nt-family: Helvetica; font-size: 12px; font-style: normal; font-variant-cap=
s: normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; word-spacing: =
0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><sp=
an style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 1=
2px; font-style: normal; font-variant-caps: normal; font-weight: normal; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;" class=
=3D"">But maybe just some bytes in LE format would be enough. No?</span><br=
 style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12p=
x; font-style: normal; font-variant-caps: normal; font-weight: normal; lett=
er-spacing: normal; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 text-decoration: none;" class=3D""></div></blockquote><div><br class=3D"">=
</div>Yes, here are the reasons we do it:</div><div>1. In cryptographic, wo=
rd 'integer' usually refer to multiple precision integer (MPI), their lengt=
h from a few hundred bits to several thousand bits, which cannot be simply =
expressed in LE format.<br class=3D""></div><div>2. Popular cryptography-re=
lated standards, for example pkcs8 and X.509, &nbsp;also use ASN.1 and DER/=
BER encoding to define asymmetric keys.</div><div>3. The following definiti=
on I only used the key part of standards, for example, =E2=80=98RsaPublicKe=
y' is just a field in X.509 certificate. The main reason is that we cannot =
get other fields from linux crypto-framework.&nbsp;</div><div><br class=3D"=
"><blockquote type=3D"cite" class=3D""><div class=3D""><br style=3D"caret-c=
olor: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: no=
rmal; font-variant-caps: normal; font-weight: normal; letter-spacing: norma=
l; text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration:=
 none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetic=
a; font-size: 12px; font-style: normal; font-variant-caps: normal; font-wei=
ght: normal; letter-spacing: normal; orphans: auto; text-align: start; text=
-indent: 0px; text-transform: none; white-space: normal; widows: auto; word=
-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">+<br class=3D"">+The schema of RSA k=
eys:<br class=3D"">+\begin{lstlisting}<br class=3D"">+RsaPrivateKey ::=3D S=
EQUENCE {<br class=3D"">+ &nbsp;&nbsp;&nbsp;version &nbsp;&nbsp;&nbsp;&nbsp=
;INTEGER<br class=3D"">+ &nbsp;&nbsp;&nbsp;n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;INTEGER<br class=3D"">+ &nbsp;&nbsp;&nbsp;e &=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;INTEGER<br class=
=3D"">+ &nbsp;&nbsp;&nbsp;d &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;INTEGER<br class=3D"">+ &nbsp;&nbsp;&nbsp;p &nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;INTEGER<br class=3D"">+ &nbsp;&nb=
sp;&nbsp;q &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;INTE=
GER<br class=3D"">+ &nbsp;&nbsp;&nbsp;e1 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;INTEGER<br class=3D"">+ &nbsp;&nbsp;&nbsp;e2 &nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;INTEGER<br class=3D"">+ &nbsp;&=
nbsp;&nbsp;u &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IN=
TEGER<br class=3D"">+}<br class=3D"">+<br class=3D"">+RsaPublicKey ::=3D SE=
QUENCE {<br class=3D"">+ &nbsp;&nbsp;&nbsp;n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;INTEGER<br class=3D"">+ &nbsp;&nbsp;&nbsp;e &=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;INTEGER<br class=
=3D"">+}<br class=3D"">+\end{lstlisting}<br class=3D"">+<br class=3D"">+The=
 schema of other algothrim currently undefined.<br class=3D""></blockquote>=
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0=
, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-var=
iant-caps: normal; font-weight: normal; letter-spacing: normal; text-align:=
 start; text-indent: 0px; text-transform: none; white-space: normal; word-s=
pacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: =
none; display: inline !important;" class=3D"">meaning?</span><br style=3D"c=
aret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-sty=
le: normal; font-variant-caps: normal; font-weight: normal; letter-spacing:=
 normal; text-align: start; text-indent: 0px; text-transform: none; white-s=
pace: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decor=
ation: none;" class=3D""></div></blockquote><div><br class=3D""></div>This =
patch introduces ASYM service, but only defines the key format of the RSA a=
lgorithm, maybe I should add the key format for the ECDSA &nbsp;algorithm (=
the same as before, the main reason is that I did not implement ends in my =
code)<br class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><b=
r style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12=
px; font-style: normal; font-variant-caps: normal; font-weight: normal; let=
ter-spacing: normal; text-align: start; text-indent: 0px; text-transform: n=
one; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px=
; text-decoration: none;" class=3D""><blockquote type=3D"cite" style=3D"fon=
t-family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps=
: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-=
align: start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-te=
xt-stroke-width: 0px; text-decoration: none;" class=3D"">+<br class=3D"">+T=
he length of \field{key} is specified in \field{key_len} in struct<br class=
=3D"">+virtio_crypto_asym_create_session_flf.<br class=3D""><br class=3D"">=
\drivernormative{\subparagraph}{Session operation: create session}{Device T=
ypes / Crypto Device / Device<br class=3D"">Operation / Control Virtqueue /=
 Session operation / Session operation: create session}<br class=3D"">@@ -7=
64,6 +899,14 @@ \subsubsection{Data Virtqueue}\label{sec:Device Types / Cry=
pto Device / Device O<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;VIRTIO_CRYPTO_O=
PCODE(VIRTIO_CRYPTO_SERVICE_AEAD, 0x00)<br class=3D"">#define VIRTIO_CRYPTO=
_AEAD_DECRYPT \<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;VIRTIO_CRYPTO_OPCODE(=
VIRTIO_CRYPTO_SERVICE_AEAD, 0x01)<br class=3D"">+#define VIRTIO_CRYPTO_ASYM=
_ENCRYPT \<br class=3D"">+ &nbsp;&nbsp;&nbsp;VIRTIO_CRYPTO_OPCODE(VIRTIO_CR=
YPTO_SERVICE_ASYM, 0x00)<br class=3D"">+#define VIRTIO_CRYPTO_ASYM_DECRYPT =
\<br class=3D"">+ &nbsp;&nbsp;&nbsp;VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERV=
ICE_ASYM, 0x01)<br class=3D"">+#define VIRTIO_CRYPTO_ASYM_SIGN \<br class=
=3D"">+ &nbsp;&nbsp;&nbsp;VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_ASYM, =
0x02)<br class=3D"">+#define VIRTIO_CRYPTO_ASYM_VERIFY \<br class=3D"">+ &n=
bsp;&nbsp;&nbsp;VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_ASYM, 0x03)<br c=
lass=3D"">&nbsp;&nbsp;&nbsp;&nbsp;le32 opcode;<br class=3D"">&nbsp;&nbsp;&n=
bsp;&nbsp;/* algo should be service-specific algorithms */<br class=3D"">&n=
bsp;&nbsp;&nbsp;&nbsp;le32 algo;<br class=3D"">@@ -1044,7 +1187,7 @@ \subsu=
bsection{MAC Service Operation}\label{sec:Device Types / Crypto Device / D<=
br class=3D"">\begin{itemize*}<br class=3D"">\item If the VIRTIO_CRYPTO_F_M=
AC_STATELESS_MODE feature bit is negotiated, the device<br class=3D"">&nbsp=
;&nbsp;&nbsp;&nbsp;MUST parse \field{flag} field in struct virtio_crypto_op=
_header in order to decide<br class=3D"">-<span class=3D"Apple-tab-span" st=
yle=3D"white-space: pre;">=09</span>which mode the driver uses.<br class=3D=
"">+ &nbsp;&nbsp;&nbsp;which mode the driver uses.<br class=3D"">\item The =
device MUST copy the results of MAC operations in the hash_result[] if HASH=
<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;operations success.<br class=3D"">\i=
tem The device MUST set \field{status} in struct virtio_crypto_inhdr to one=
 of the<br class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-c=
aps: normal; font-weight: normal; letter-spacing: normal; text-align: start=
; text-indent: 0px; text-transform: none; white-space: normal; word-spacing=
: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><=
br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 1=
2px; font-style: normal; font-variant-caps: normal; font-weight: normal; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0,=
 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-vari=
ant-caps: normal; font-weight: normal; letter-spacing: normal; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; word-sp=
acing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: n=
one; display: inline !important;" class=3D"">don't do it in this patch pls.=
</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font=
-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: no=
rmal; letter-spacing: normal; text-align: start; text-indent: 0px; text-tra=
nsform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-w=
idth: 0px; text-decoration: none;" class=3D""><br style=3D"caret-color: rgb=
(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; fon=
t-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-a=
lign: start; text-indent: 0px; text-transform: none; white-space: normal; w=
ord-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" c=
lass=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; font-s=
ize: 12px; font-style: normal; font-variant-caps: normal; font-weight: norm=
al; letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; word-spacing:=
 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-=
decoration: none;" class=3D"">@@ -1369,7 +1512,7 @@ \subsubsection{Symmetri=
c algorithms Operation}\label{sec:Device Types / Crypto D<br class=3D"">\be=
gin{itemize*}<br class=3D"">\item If the VIRTIO_CRYPTO_F_CIPHER_STATELESS_M=
ODE feature bit is negotiated, the device<br class=3D"">&nbsp;&nbsp;&nbsp;&=
nbsp;MUST parse \field{flag} field in struct virtio_crypto_op_header in ord=
er to decide<br class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-s=
pace: pre;">=09</span>which mode the driver uses.<br class=3D"">+ &nbsp;&nb=
sp;&nbsp;which mode the driver uses.<br class=3D"">\item The device MUST pa=
rse the virtio_crypto_sym_data_req based on the \field{opcode}<br class=3D"=
">&nbsp;&nbsp;&nbsp;&nbsp;field in general header.<br class=3D"">\item The =
device MUST parse the fields of struct virtio_crypto_cipher_data_flf in<br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); font-family=
: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal=
; font-weight: normal; letter-spacing: normal; text-align: start; text-inde=
nt: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span style=
=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; fon=
t-style: normal; font-variant-caps: normal; font-weight: normal; letter-spa=
cing: normal; text-align: start; text-indent: 0px; text-transform: none; wh=
ite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-=
decoration: none; float: none; display: inline !important;" class=3D"">same=
</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font=
-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: no=
rmal; letter-spacing: normal; text-align: start; text-indent: 0px; text-tra=
nsform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-w=
idth: 0px; text-decoration: none;" class=3D""><br style=3D"caret-color: rgb=
(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; fon=
t-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-a=
lign: start; text-indent: 0px; text-transform: none; white-space: normal; w=
ord-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" c=
lass=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; font-s=
ize: 12px; font-style: normal; font-variant-caps: normal; font-weight: norm=
al; letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; word-spacing:=
 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-=
decoration: none;" class=3D"">@@ -1518,7 +1661,7 @@ \subsubsection{AEAD Ser=
vice Operation}\label{sec:Device Types / Crypto Device /<br class=3D"">\beg=
in{itemize*}<br class=3D"">\item If the VIRTIO_CRYPTO_F_AEAD_STATELESS_MODE=
 feature bit is negotiated, the<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;devic=
e MUST parse the virtio_crypto_aead_data_vlf_stateless based on the \field{=
opcode}<br class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:=
 pre;">=09</span>field in general header.<br class=3D"">+ &nbsp;&nbsp;&nbsp=
;field in general header.<br class=3D"">\item The device MUST copy the resu=
lt of cryptographic operation in the dst_data[].<br class=3D"">\item The de=
vice MUST copy the authentication tag in the dst_data[] offset the cipher r=
esult.<br class=3D"">\item The device MUST set the \field{status} field in =
struct virtio_crypto_inhdr to<br class=3D""></blockquote><br style=3D"caret=
-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: nor=
mal; text-align: start; text-indent: 0px; text-transform: none; white-space=
: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoratio=
n: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family:=
 Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal;=
 font-weight: normal; letter-spacing: normal; text-align: start; text-inden=
t: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webk=
it-text-stroke-width: 0px; text-decoration: none; float: none; display: inl=
ine !important;" class=3D"">same</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; font-varia=
nt-caps: normal; font-weight: normal; letter-spacing: normal; text-align: s=
tart; text-indent: 0px; text-transform: none; white-space: normal; word-spa=
cing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D=
""><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none;" class=3D""><blockquote type=3D"cite" style=
=3D"font-family: Helvetica; font-size: 12px; font-style: normal; font-varia=
nt-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto=
; text-align: start; text-indent: 0px; text-transform: none; white-space: n=
ormal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -we=
bkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">@@ -1533,3 =
+1676,66 @@ \subsubsection{AEAD Service Operation}\label{sec:Device Types /=
 Crypto Device /<br class=3D"">\item VIRTIO_CRYPTO_ERR if any failure not m=
entioned above occurs.<br class=3D"">\end{itemize*}<br class=3D"">\end{item=
ize*}<br class=3D"">+<br class=3D"">+\subsubsection{ASYM Service Operation}=
\label{sec:Device Types / Crypto Device / Device Operation / ASYM Service O=
peration}<br class=3D"">+<br class=3D"">+Session mode requests of asymmetri=
c algorithm are as follows:<br class=3D""></blockquote><br style=3D"caret-c=
olor: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: no=
rmal; font-variant-caps: normal; font-weight: normal; letter-spacing: norma=
l; text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration:=
 none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: Hel=
vetica; font-size: 12px; font-style: normal; font-variant-caps: normal; fon=
t-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0=
px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-t=
ext-stroke-width: 0px; text-decoration: none;" class=3D""><span style=3D"ca=
ret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-styl=
e: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; white-sp=
ace: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decora=
tion: none; float: none; display: inline !important;" class=3D"">the asymme=
tric?</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica;=
 font-size: 12px; font-style: normal; font-variant-caps: normal; font-weigh=
t: normal; letter-spacing: normal; text-align: start; text-indent: 0px; tex=
t-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-str=
oke-width: 0px; text-decoration: none;" class=3D""><br style=3D"caret-color=
: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal=
; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; t=
ext-align: start; text-indent: 0px; text-transform: none; white-space: norm=
al; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: non=
e;" class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; f=
ont-size: 12px; font-style: normal; font-variant-caps: normal; font-weight:=
 normal; letter-spacing: normal; orphans: auto; text-align: start; text-ind=
ent: 0px; text-transform: none; white-space: normal; widows: auto; word-spa=
cing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">+<br class=3D"">+\begin{lstlisting}<br c=
lass=3D"">+struct virtio_crypto_asym_data_flf {<br class=3D"">+ &nbsp;&nbsp=
;&nbsp;/*<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;* For Encrypt/Decrypt/Sig=
n, src data is the plaintext/ciphertext/digest,<br class=3D"">+ &nbsp;&nbsp=
;&nbsp;&nbsp;* and dst data is the ciphertext/plaintext/digest.<br class=3D=
"">+ &nbsp;&nbsp;&nbsp;&nbsp;* For verify, src data is signature, and dst d=
ata is the digest.<br class=3D""></blockquote><br style=3D"caret-color: rgb=
(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; fon=
t-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-a=
lign: start; text-indent: 0px; text-transform: none; white-space: normal; w=
ord-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" c=
lass=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica;=
 font-size: 12px; font-style: normal; font-variant-caps: normal; font-weigh=
t: normal; letter-spacing: normal; text-align: start; text-indent: 0px; tex=
t-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-str=
oke-width: 0px; text-decoration: none; float: none; display: inline !import=
ant;" class=3D"">Verify? the signature?</span><br style=3D"caret-color: rgb=
(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; fon=
t-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-a=
lign: start; text-indent: 0px; text-transform: none; white-space: normal; w=
ord-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" c=
lass=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; f=
ont-size: 12px; font-style: normal; font-variant-caps: normal; font-weight:=
 normal; letter-spacing: normal; text-align: start; text-indent: 0px; text-=
transform: none; white-space: normal; word-spacing: 0px; -webkit-text-strok=
e-width: 0px; text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; font-=
variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans:=
 auto; text-align: start; text-indent: 0px; text-transform: none; white-spa=
ce: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto=
; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">+ &nbs=
p;&nbsp;&nbsp;&nbsp;*/<br class=3D"">+ &nbsp;&nbsp;&nbsp;/* length of sourc=
e data */<br class=3D"">+ &nbsp;&nbsp;&nbsp;le32 src_data_len;<br class=3D"=
">+ &nbsp;&nbsp;&nbsp;/* length of dst data */<br class=3D"">+ &nbsp;&nbsp;=
&nbsp;le32 dst_data_len;<br class=3D"">+};<br class=3D"">+<br class=3D"">+s=
truct virtio_crypto_asym_data_vlf {<br class=3D"">+ &nbsp;&nbsp;&nbsp;/* De=
vice read only portion */<br class=3D"">+<br class=3D"">+ &nbsp;&nbsp;&nbsp=
;/*<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;* For Encrypt/Decrypt/Sign, src=
_data_len equals src_data_len field of struct<br class=3D"">+ &nbsp;&nbsp;&=
nbsp;&nbsp;* virtio_crypto_asym_data_flf, dst_data_len equals dst_data_len =
field of struct<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;* virtio_crypto_asy=
m_data_flf.<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;* For Verify, src_data_=
len equals the sum of src_data_len and dst_data_len in<br class=3D"">+ &nbs=
p;&nbsp;&nbsp;&nbsp;* struct virtio_crypto_asym_data_flf. and dst_data_len =
always equals zero.<br class=3D""></blockquote><br style=3D"caret-color: rg=
b(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; fo=
nt-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-=
align: start; text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica=
; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weig=
ht: normal; letter-spacing: normal; text-align: start; text-indent: 0px; te=
xt-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-st=
roke-width: 0px; text-decoration: none; float: none; display: inline !impor=
tant;" class=3D"">no .?</span><br style=3D"caret-color: rgb(0, 0, 0); font-=
family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; tex=
t-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br st=
yle=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; letter-=
spacing: normal; text-align: start; text-indent: 0px; text-transform: none;=
 white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; te=
xt-decoration: none;" class=3D""><blockquote type=3D"cite" style=3D"font-fa=
mily: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: no=
rmal; font-weight: normal; letter-spacing: normal; orphans: auto; text-alig=
n: start; text-indent: 0px; text-transform: none; white-space: normal; wido=
ws: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-s=
troke-width: 0px; text-decoration: none;" class=3D"">+ &nbsp;&nbsp;&nbsp;&n=
bsp;*/<br class=3D"">+ &nbsp;&nbsp;&nbsp;/* Source data */<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;u8 src_data[src_data_len];<br class=3D"">+<br class=3D"">=
+ &nbsp;&nbsp;&nbsp;/* Device write only portion */<br class=3D"">+ &nbsp;&=
nbsp;&nbsp;/* Pointer to output data */<br class=3D"">+ &nbsp;&nbsp;&nbsp;u=
8 dst_data[dst_data_len];<br class=3D"">+};<br class=3D"">+\end{lstlisting}=
<br class=3D"">+<br class=3D"">+\drivernormative{\paragraph}{ASYM Service O=
peration}{Device Types / Crypto Device / Device Operation / ASYM Service Op=
eration}<br class=3D"">+<br class=3D"">+\begin{itemize*}<br class=3D"">+\it=
em The driver MUST set \field{session_id} in struct virtio_crypto_op_header=
 to a valid value assigned<br class=3D"">+ &nbsp;&nbsp;&nbsp;by the device =
when the session was created.<br class=3D"">+\item The driver MUST set the =
\field{opcode} field in struct virtio_crypto_op_header<br class=3D"">+ &nbs=
p;&nbsp;&nbsp;to one of VIRTIO_CRYPTO_ASYM_ENCRYPT, VIRTIO_CRYPTO_ASYM_DEST=
ROY_SESSION, VIRTIO_CRYPTO_ASYM_SIGN and VIRTIO_CRYPTO_ASYM_VERIFY.<br clas=
s=3D"">+\end{itemize*}<br class=3D"">+<br class=3D"">+\devicenormative{\par=
agraph}{ASYM Service Operation}{Device Types / Crypto Device / Device Opera=
tion / ASYM Service Operation}<br class=3D"">+<br class=3D"">+\begin{itemiz=
e*}<br class=3D"">+\item The device MUST parse the virtio_crypto_aead_data_=
vlf_stateless based on the \field{opcode}<br class=3D"">+ &nbsp;&nbsp;&nbsp=
;field in general header.<br class=3D"">+\item The device MUST copy the res=
ult of cryptographic operation in the dst_data[].<br class=3D"">+\item The =
device MUST set the \field{status} field in struct virtio_crypto_inhdr to<b=
r class=3D"">+ &nbsp;&nbsp;&nbsp;one of the following values of enum VIRTIO=
_CRYPTO_STATUS:<br class=3D"">+\begin{itemize*}<br class=3D"">+\item VIRTIO=
_CRYPTO_OK if the operation success.<br class=3D"">+\item VIRTIO_CRYPTO_NOT=
SUPP if the requested algorithm or operation is unsupported.<br class=3D"">=
+\item VIRTIO_CRYPTO_BADMSG if the verification result is incorrect.<br cla=
ss=3D"">+\item VIRTIO_CRYPTO_INVSESS if the session ID invalid when in sess=
ion mode.<br class=3D"">+\item VIRTIO_CRYPTO_KEY_REJECTED if the signature =
verification failed.<br class=3D"">+\item VIRTIO_CRYPTO_ERR if any failure =
not mentioned above occurs.<br class=3D"">+\end{itemize*}<br class=3D"">+\e=
nd{itemize*}<br class=3D"">--<span class=3D"Apple-converted-space">&nbsp;</=
span><br class=3D"">2.11.0</blockquote></div></blockquote></div><br class=
=3D""></body></html>
--Apple-Mail=_78058476-023A-46DB-ACAE-372BBAD41DC3--

