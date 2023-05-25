Return-Path: <virtio-comment-return-6035-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3438C77B7A
	for <virtio-comment@archiver.kernel.org>; Thu, 25 May 2023 09:35:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B5A972B061
	for <virtio-comment@archiver.kernel.org>; Thu, 25 May 2023 09:35:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 86F8E986559
	for <virtio-comment@archiver.kernel.org>; Thu, 25 May 2023 09:35:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 68F1C986555; Thu, 25 May 2023 09:35:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3B87F986556
	for <virtio-comment@lists.oasis-open.org>; Thu, 25 May 2023 09:34:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 9TvHcMP_MoKqfFYA7amb1Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685007247; x=1687599247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4pe0mqOKFx7Aa0nIwEQOdoDkbC2LPrdA2M04YdpUKI=;
        b=Nl03TFltquuDkN0ZlOOwxcgc/kowBFh7PX89UDt/mLzPdtQI7KD4YKjdK0m3eLbYpC
         4bHgYg2Rjb5EIGK4SOeXvM6nmEdoZQK+j3bB7Znx2uHhR2VM49pgZjXLo6Y2tCro1WLk
         WKmD9qKVjypJBVnpVJOKyHMskAaQ/b3OWh3IxHsctkYlLNHmrLYEpc/Bs5g0pigtZjGq
         IbaiX0pF5fOMS/tbirsTds9BVTJZhAtKKnEoD2BhpalKKUhfMuB14NoxENvx/uzt+nCu
         8x7qf5QlHqeHIEerXajaDegvTmzSWqFQfatijoYFnl7X9GnUNX91drqUukV8Sd8d4OAC
         3ZXg==
X-Gm-Message-State: AC+VfDxuhe5Gw/NnK9Eu+EIIoatCokZ7/qrTT95yymrmZ9RE6FMLBnrL
	FZuyM1q2Tu5jiyIJEAbXqNFUErZw2ek7vUZ6FvWPuMtxzD5LPTV+ZQZegQdG5CYsgcwrkmlrd+d
	aw2fMeukQFahGakzfK3KuFNI3Gz8zNnqxTg==
X-Received: by 2002:ac8:5bc4:0:b0:3ef:3960:a1b4 with SMTP id b4-20020ac85bc4000000b003ef3960a1b4mr29838179qtb.10.1685007246765;
        Thu, 25 May 2023 02:34:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4hF+8Q/UwER0XovizuHUrYDZ+aamWCpiFGr52Vs3EvhuwTr804ri5a3lynlQH9VdETbEvP9g==
X-Received: by 2002:ac8:5bc4:0:b0:3ef:3960:a1b4 with SMTP id b4-20020ac85bc4000000b003ef3960a1b4mr29838174qtb.10.1685007246493;
        Thu, 25 May 2023 02:34:06 -0700 (PDT)
Date: Thu, 25 May 2023 05:34:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gowrishankar Muthukrishnan <gmuthukrishn@marvell.com>
Cc: virtio-comment@lists.oasis-open.org,
	zhenwei pi <pizhenwei@bytedance.com>,
	Lei He <helei.sig11@bytedance.com>,
	Anoob Joseph <anoobj@marvell.com>, jerinj@marvell.com
Message-ID: <20230525053227-mutt-send-email-mst@kernel.org>
References: <20230525073108.2579235-1-gmuthukrishn@marvell.com>
MIME-Version: 1.0
In-Reply-To: <20230525073108.2579235-1-gmuthukrishn@marvell.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v1] virtio-crypto: add RSA private key types

On Thu, May 25, 2023 at 01:01:08PM +0530, Gowrishankar Muthukrishnan wrote:
> With reference to RFC 3447 Section 3.2, private key exists in any of
> the two forms, namely:
>  - exponent
>  - quintuple
> 
> Following this, Appendix A.1.2 recommends private key represented
> including both of the above representations. Hence, for a RSA op,
> it is required to choose one of these types, hence proposing
> two private key types.
> 
> Signed-off-by: Gowrishankar Muthukrishnan <gmuthukrishn@marvell.com>
> ---
>  device-types/crypto/description.tex | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/device-types/crypto/description.tex b/device-types/crypto/description.tex
> index 5705e26..02dcdd0 100644
> --- a/device-types/crypto/description.tex
> +++ b/device-types/crypto/description.tex
> @@ -749,6 +749,11 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Crypto Device / Devic
>  #define VIRTIO_CRYPTO_RSA_SHA512    8
>  #define VIRTIO_CRYPTO_RSA_SHA224    9
>      le32 hash_algo;
> +
> +#define VIRTIO_CRYPTO_RSA_PRIVATE_KEY_UNKNOWN 0
> +#define VIRTIO_CRYPTO_RSA_PRIVATE_KEY_EXP     1
> +#define VIRTIO_CRYPTO_RSA_PRIVATE_KEY_QT      2
> +    le8 private_key_type;

add padding to keep things aligned, or just use 32 bit

>  };
>  \end{lstlisting}
>  
> @@ -764,6 +769,13 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Crypto Device / Devic
>  It only affects the padding algorithm and is ignored during encryption and decryption.
>  \end{itemize*}
>  
> +\field{private_key_type} specifies the type of private key used by RSA sessions.
> +\begin{itemize*}
> +\item If VIRTIO_CRYPTO_RSA_PRIVATE_KEY_EXP is specified, privateExponent is used.
> +\item If VIRTIO_CRYPTO_RSA_PRIVATE_KEY_QT is specified, prime1, prime2,
> +exponent1, exponent2 and coefficient values are used (see \hyperref[intro:rfc3447]{PKCS\#1}).
> +\end{itemize*}
> +
>  The ECC algorithms such as the ECDSA algorithm, cannot use custom curves, only the
>  following known curves can be used (see \hyperref[intro:NIST]{NIST-recommended curves}).
>  

I think we will need a feature bit to negotiate the change in virtio_crypto_rsa_session_para
format.

-- 
MST


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

