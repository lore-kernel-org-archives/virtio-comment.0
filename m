Return-Path: <virtio-comment-return-2329-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1BC95986450
	for <virtio-comment@lists.oasis-open.org>; Thu,  4 Nov 2021 12:14:45 +0000 (UTC)
Date: Thu, 4 Nov 2021 08:14:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20211104080418-mutt-send-email-mst@kernel.org>
References: <20211025033045.82123-1-helei.sig11@bytedance.com>
 <20211025033045.82123-2-helei.sig11@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20211025033045.82123-2-helei.sig11@bytedance.com>
Subject: [virtio-comment] Re: [PATCH 1/1] virtio-crypto: introduce asym service
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Lei He <helei.sig11@bytedance.com>
Cc: virtio-comment@lists.oasis-open.org, xin.zeng@intel.com, arei.gonglei@huawei.com, pizhenwei@bytedance.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Oct 25, 2021 at 11:30:45AM +0800, Lei He wrote:
> Introduce asym service type, several asymmetric algorithms and
> relevent information:
>   - RSA(padding algorithm, ASN.1 schema definition)
>   - DSA
>   - ECDSA(ecc algorithm)
> 
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> Signed-off-by: Lei He <helei.sig11@bytedance.com>
> ---
>  virtio-crypto.tex | 214 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 210 insertions(+), 4 deletions(-)
> 
> diff --git a/virtio-crypto.tex b/virtio-crypto.tex
> index 74746f9..53339a1 100644
> --- a/virtio-crypto.tex
> +++ b/virtio-crypto.tex
> @@ -41,6 +41,7 @@ \subsection{Feature bits}\label{sec:Device Types / Crypto Device / Feature bits}
>      supported by the AEAD service.
>  \end{description}
>  
> +Currently, ASYM service do not support stateless mode.
>  
>  \subsubsection{Feature bit requirements}\label{sec:Device Types / Crypto Device / Feature bit requirements}
>

Drop Currently here pls.
  
> @@ -67,6 +68,8 @@ \subsection{Supported crypto services}\label{sec:Device Types / Crypto Device /
>  #define VIRTIO_CRYPTO_SERVICE_MAC    2
>  /* AEAD (Authenticated Encryption with Associated Data) service */
>  #define VIRTIO_CRYPTO_SERVICE_AEAD   3
> +/* ASYM (Asymmetric Key Cipher) service */
> +#define VIRTIO_CRYPTO_SERVICE_ASYM   4
>  \end{lstlisting}
>  
>  The above constants designate bits used to indicate the which of crypto services are
> @@ -181,6 +184,65 @@ \subsubsection{AEAD services}\label{sec:Device Types / Crypto Device / Supported
>  operation requests, see \ref{sec:Device Types / Crypto Device / Device Operation / Control Virtqueue / Session operation}.
>  \end{enumerate}
>  
> +\subsection{ASYM services}\label{sec: Device Teypes / Crypto Device / Supported crypto services / ASYM services}
> +
> +The following ASYM key types are defined:
> +\begin{lstlisting}
> +#define VIRTIO_CRYPTO_ASYM_KEY_TYPE_PUBLIC  1
> +#define VIRTIO_CRYPTO_ASYM_KEY_TYPE_PRIVATE 2
> +\end{lstlisting}
> +
> +The above constants are used to disignate the key types in asymmetric crypto operation requests,

typo

> +see \ref{sec:Device Types / Crypto Device / Device Operation / Control Virtqueue / Session operation}.
> +
> +The following ASYM algorithms are defined:
> +\begin{lstlisting}
> +#define VIRTIO_CRYPTO_NO_ASYM    0
> +#define VIRTIO_CRYPTO_ASYM_RSA   1
> +#define VIRTIO_CRYPTO_ASYM_DSA   2
> +#define VIRTIO_CRYPTO_ASYM_ECDSA 3
> +\end{lstlisting}
> +
> +The above constants have two usages:
> +\begin{enumerate}
> +\item As bit numbers, used to tell the driver which ASYM algorithms
> +are supported by the device, see \ref{sec:Device Types / Crypto Device / Device configuration layout}.
> +\item As values, used to disignate the algorithm in asymmetric crypto operation requests,

typo

> +see \ref{sec:Device Types / Crypto Device / Device Operation / Control Virtqueue / Session operation}.
> +\end{enumerate}
> +
> +
> +For RSA algorithm, the following padding algorithms are defined:

the RSA?

> +\begin{lstlisting}
> +#define VIRTIO_CRYPTO_RSA_RAW_PADDING   0
> +#define VIRTIO_CRYPTO_RSA_PKCS1_PADDING 1
> +\end{lstlisting}
> +
> +For RSA algorithm, the following hash algorithms are defined, which is used

are used?

> +to calculate padding result.
> +\begin{lstlisting}
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
> +\end{lstlisting}
> +
> +For ECC algorithms such as ecdsa, the following curves are defined:

ECDSA?

> +\begin{lstlisting}
> +#define VIRTIO_CRYPTO_CURVE_UNKNOWN   0
> +#define VIRTIO_CRYPTO_CURVE_NIST_P192 1
> +#define VIRTIO_CRYPTO_CURVE_NIST_P224 2
> +#define VIRTIO_CRYPTO_CURVE_NIST_P256 3
> +#define VIRTIO_CRYPTO_CURVE_NIST_P384 4
> +#define VIRTIO_CRYPTO_CURVE_NIST_P521 5
> +\end{lstlisting}
> +
>  \subsection{Device configuration layout}\label{sec:Device Types / Crypto Device / Device configuration layout}
>  
>  Crypto device configuration uses the following layout structure:
> @@ -204,6 +266,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / Crypto Device
>      le32 reserved;
>      /* Maximum size of each crypto request's content in bytes */
>      le64 max_size;
> +    le32 asym_algo;
>  };
>  \end{lstlisting}
>  
> @@ -323,6 +386,7 @@ \subsubsection{Operation Status}\label{sec:Device Types / Crypto Device / Device
>      VIRTIO_CRYPTO_NOTSUPP = 3,
>      VIRTIO_CRYPTO_INVSESS = 4,
>      VIRTIO_CRYPTO_NOSPC = 5,
> +    VIRTIO_CRYPTO_KEY_REJECTED = 6,
>      VIRTIO_CRYPTO_MAX
>  };
>  \end{lstlisting}
> @@ -334,6 +398,7 @@ \subsubsection{Operation Status}\label{sec:Device Types / Crypto Device / Device
>  \item VIRTIO_CRYPTO_INVSESS: invalid session ID when executing crypto operations.
>  \item VIRTIO_CRYPTO_NOSPC: no free session ID (only when the VIRTIO_CRYPTO_F_REVISION_1
>      feature bit is negotiated).
> +\item VIRTIO_CRYPTO_KEY_REJECTED: signature verify failed (only when akcipher verify).

verification?

what is akcipher?



>  \item VIRTIO_CRYPTO_ERR: any failure not mentioned above occurs.
>  \end{itemize*}
>  
> @@ -364,6 +429,10 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Crypto Device / Devic
>         VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AEAD, 0x02)
>  #define VIRTIO_CRYPTO_AEAD_DESTROY_SESSION \
>         VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AEAD, 0x03)
> +#define VIRTIO_CRYPTO_ASYM_CREATE_SESSION \
> +       VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_ASYM, 0x04)
> +#define VIRTIO_CRYPTO_ASYM_DESTROY_SESSION \
> +       VIRTIO_CRYPTO_OPCDE(VIRTIO_CRYPTO_SERVICE_ASYM, 0x05)
>      le32 opcode;
>      /* algo should be service-specific algorithms */
>      le32 algo;
> @@ -658,7 +727,6 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Crypto Device / Devic
>  
>  \field{vlf_len} is the size of the specific structure used.
>  
> -
>  \subparagraph{Session operation: AEAD session}\label{sec:Device Types / Crypto Device / Device
>  Operation / Control Virtqueue / Session operation / Session operation: AEAD session}
>

don't do this in this patch pls.
  
> @@ -690,6 +758,73 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Crypto Device / Devic
>  The length of \field{key} is specified in \field{key_len} in struct
>  virtio_crypto_aead_create_session_flf.
>  
> +\subparagraph{Session operation: ASYM session}\label{sec:Device Types / Crypto Device / Device
> +Operation / Control Virtqueue / Session operation / Session operation: ASYM session}
> +
> +The request of ASYM session could be ASYM algorithms request.

meaning? and is it always in a session?

> +The fixed-length and the variable-length parameters of ASYM session requests are as follows:
> +\begin{lstlisting}
> +struct virtio_crypto_asym_create_session_flf {
> +    /* Device read only portion */
> +
> +    /* See VIRTIO_CRYPTO_ASYM_* above */
> +    le32 algo;
> +    /* See VIRTIO_CRYPTO_ASYM_KEY_TYPE_* above */
> +    le32 key_type;
> +    /* length of key */
> +    le32 key_len;
> +    /* algothrim specific parameters */
> +    union {
> +        struct virtio_crypto_rsa_session_para rsa;
> +        struct virtio_crypto_ecdsa_session_para ecdsa;
> +    } u;
> +};
> +
> +struct virtio_crypto_rsa_session_para {
> +    /* Padding algorithm used for rsa, see VIRTIO_CRYPTO_RSA_* above */

RSA?

> +    le32 padding_algo;
> +    /* Hash algorithm used for padding digest, see VIRTIO_CRYPTO_RSA_* above */
> +    le32 hash_algo;
> +};
> +
> +struct virtio_crypto_ecdsa_session_para {
> +    /* Known elliptic curves, see VIRTIO_CRYPTO_CURVE_* */
> +    le32 curve_id;
> +};
> +
> +struct virtio_crypto_asym_create_session_vlf {
> +    /* Device read only portion */
> +    u8 key[key_len];
> +};
> +\end{lstlisting}
> +
> +The length of cipher_key is specificed in key_len in the struct virtio_asym_session_flf.
> +The format of asymmetric keys is defined with ASN.1 schema and is encoded by DER format.

Is it important that we do it like this?
If we do we need to link to that spec.

But maybe just some bytes in LE format would be enough. No?

> +
> +The schema of RSA keys:
> +\begin{lstlisting}
> +RsaPrivateKey ::= SEQUENCE {
> +    version     INTEGER
> +    n           INTEGER
> +    e           INTEGER
> +    d           INTEGER
> +    p           INTEGER
> +    q           INTEGER
> +    e1          INTEGER
> +    e2          INTEGER
> +    u           INTEGER
> +}
> +
> +RsaPublicKey ::= SEQUENCE {
> +    n           INTEGER
> +    e           INTEGER
> +}
> +\end{lstlisting}
> +
> +The schema of other algothrim currently undefined.

meaning?

> +
> +The length of \field{key} is specified in \field{key_len} in struct
> +virtio_crypto_asym_create_session_flf.
>  
>  \drivernormative{\subparagraph}{Session operation: create session}{Device Types / Crypto Device / Device
>  Operation / Control Virtqueue / Session operation / Session operation: create session}
> @@ -764,6 +899,14 @@ \subsubsection{Data Virtqueue}\label{sec:Device Types / Crypto Device / Device O
>      VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AEAD, 0x00)
>  #define VIRTIO_CRYPTO_AEAD_DECRYPT \
>      VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AEAD, 0x01)
> +#define VIRTIO_CRYPTO_ASYM_ENCRYPT \
> +    VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_ASYM, 0x00)
> +#define VIRTIO_CRYPTO_ASYM_DECRYPT \
> +    VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_ASYM, 0x01)
> +#define VIRTIO_CRYPTO_ASYM_SIGN \
> +    VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_ASYM, 0x02)
> +#define VIRTIO_CRYPTO_ASYM_VERIFY \
> +    VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_ASYM, 0x03)
>      le32 opcode;
>      /* algo should be service-specific algorithms */
>      le32 algo;
> @@ -1044,7 +1187,7 @@ \subsubsection{MAC Service Operation}\label{sec:Device Types / Crypto Device / D
>  \begin{itemize*}
>  \item If the VIRTIO_CRYPTO_F_MAC_STATELESS_MODE feature bit is negotiated, the device
>      MUST parse \field{flag} field in struct virtio_crypto_op_header in order to decide
> -	which mode the driver uses.
> +    which mode the driver uses.
>  \item The device MUST copy the results of MAC operations in the hash_result[] if HASH
>      operations success.
>  \item The device MUST set \field{status} in struct virtio_crypto_inhdr to one of the


don't do it in this patch pls.

> @@ -1369,7 +1512,7 @@ \subsubsection{Symmetric algorithms Operation}\label{sec:Device Types / Crypto D
>  \begin{itemize*}
>  \item If the VIRTIO_CRYPTO_F_CIPHER_STATELESS_MODE feature bit is negotiated, the device
>      MUST parse \field{flag} field in struct virtio_crypto_op_header in order to decide
> -	which mode the driver uses.
> +    which mode the driver uses.
>  \item The device MUST parse the virtio_crypto_sym_data_req based on the \field{opcode}
>      field in general header.
>  \item The device MUST parse the fields of struct virtio_crypto_cipher_data_flf in

same

> @@ -1518,7 +1661,7 @@ \subsubsection{AEAD Service Operation}\label{sec:Device Types / Crypto Device /
>  \begin{itemize*}
>  \item If the VIRTIO_CRYPTO_F_AEAD_STATELESS_MODE feature bit is negotiated, the
>      device MUST parse the virtio_crypto_aead_data_vlf_stateless based on the \field{opcode}
> -	field in general header.
> +    field in general header.
>  \item The device MUST copy the result of cryptographic operation in the dst_data[].
>  \item The device MUST copy the authentication tag in the dst_data[] offset the cipher result.
>  \item The device MUST set the \field{status} field in struct virtio_crypto_inhdr to

same

> @@ -1533,3 +1676,66 @@ \subsubsection{AEAD Service Operation}\label{sec:Device Types / Crypto Device /
>  \item VIRTIO_CRYPTO_ERR if any failure not mentioned above occurs.
>  \end{itemize*}
>  \end{itemize*}
> +
> +\subsubsection{ASYM Service Operation}\label{sec:Device Types / Crypto Device / Device Operation / ASYM Service Operation}
> +
> +Session mode requests of asymmetric algorithm are as follows:


the asymmetric?

> +
> +\begin{lstlisting}
> +struct virtio_crypto_asym_data_flf {
> +    /*
> +     * For Encrypt/Decrypt/Sign, src data is the plaintext/ciphertext/digest,
> +     * and dst data is the ciphertext/plaintext/digest.
> +     * For verify, src data is signature, and dst data is the digest.

Verify? the signature?

> +     */
> +    /* length of source data */
> +    le32 src_data_len;
> +    /* length of dst data */
> +    le32 dst_data_len;
> +};
> +
> +struct virtio_crypto_asym_data_vlf {
> +    /* Device read only portion */
> +
> +    /*
> +     * For Encrypt/Decrypt/Sign, src_data_len equals src_data_len field of struct
> +     * virtio_crypto_asym_data_flf, dst_data_len equals dst_data_len field of struct
> +     * virtio_crypto_asym_data_flf.
> +     * For Verify, src_data_len equals the sum of src_data_len and dst_data_len in
> +     * struct virtio_crypto_asym_data_flf. and dst_data_len always equals zero.

no .?

> +     */
> +    /* Source data */
> +    u8 src_data[src_data_len];
> +
> +    /* Device write only portion */
> +    /* Pointer to output data */
> +    u8 dst_data[dst_data_len];
> +};
> +\end{lstlisting}
> +
> +\drivernormative{\paragraph}{ASYM Service Operation}{Device Types / Crypto Device / Device Operation / ASYM Service Operation}
> +
> +\begin{itemize*}
> +\item The driver MUST set \field{session_id} in struct virtio_crypto_op_header to a valid value assigned
> +    by the device when the session was created.
> +\item The driver MUST set the \field{opcode} field in struct virtio_crypto_op_header
> +    to one of VIRTIO_CRYPTO_ASYM_ENCRYPT, VIRTIO_CRYPTO_ASYM_DESTROY_SESSION, VIRTIO_CRYPTO_ASYM_SIGN and VIRTIO_CRYPTO_ASYM_VERIFY.
> +\end{itemize*}
> +
> +\devicenormative{\paragraph}{ASYM Service Operation}{Device Types / Crypto Device / Device Operation / ASYM Service Operation}
> +
> +\begin{itemize*}
> +\item The device MUST parse the virtio_crypto_aead_data_vlf_stateless based on the \field{opcode}
> +    field in general header.
> +\item The device MUST copy the result of cryptographic operation in the dst_data[].
> +\item The device MUST set the \field{status} field in struct virtio_crypto_inhdr to
> +    one of the following values of enum VIRTIO_CRYPTO_STATUS:
> +\begin{itemize*}
> +\item VIRTIO_CRYPTO_OK if the operation success.
> +\item VIRTIO_CRYPTO_NOTSUPP if the requested algorithm or operation is unsupported.
> +\item VIRTIO_CRYPTO_BADMSG if the verification result is incorrect.
> +\item VIRTIO_CRYPTO_INVSESS if the session ID invalid when in session mode.
> +\item VIRTIO_CRYPTO_KEY_REJECTED if the signature verification failed.
> +\item VIRTIO_CRYPTO_ERR if any failure not mentioned above occurs.
> +\end{itemize*}
> +\end{itemize*}
> -- 
> 2.11.0


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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

