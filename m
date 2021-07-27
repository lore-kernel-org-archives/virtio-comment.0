Return-Path: <virtio-comment-return-2072-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B07529863B1
	for <virtio-comment@lists.oasis-open.org>; Tue, 27 Jul 2021 13:49:45 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20210726163850.201851-4-gaetan.harter@opensynergy.com>
References: <20210726163850.201851-1-gaetan.harter@opensynergy.com>
 <20210726163850.201851-4-gaetan.harter@opensynergy.com>
Date: Tue, 27 Jul 2021 15:49:38 +0200
Message-ID: <87o8an50jx.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH 3/3] virtio-crypto: fix missing verb
Content-Type: text/plain
To: Gaetan Harter <gaetan.harter@opensynergy.com>, virtio-comment@lists.oasis-open.org
Cc: Gaetan Harter <gaetan.harter@opensynergy.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Jul 26 2021, Gaetan Harter <gaetan.harter@opensynergy.com> wrote:

> The condition was incomplete "guarantee the size IS within the max_len".
>
> Signed-off-by: Gaetan Harter <gaetan.harter@opensynergy.com>
> ---
>  virtio-crypto.tex | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/virtio-crypto.tex b/virtio-crypto.tex
> index 4a15e14..0d1d832 100644
> --- a/virtio-crypto.tex
> +++ b/virtio-crypto.tex
> @@ -275,13 +275,13 @@ \subsection{Device configuration layout}\label{sec:Device Types / Crypto Device
>  \item The driver MUST read the detailed algorithms fields based on \field{crypto_services} field.
>  \item The driver SHOULD read \field{max_size} to discover the maximum size of the variable-length
>      parameters of data operation of the crypto request's content the device supports and MUST
> -    guarantee the size of each crypto request's content within the \field{max_size}, otherwise
> +    guarantee the size of each crypto request's content is within the \field{max_size}, otherwise
>      the request will fail and the driver MUST reset the device.
>  \item The driver SHOULD read \field{max_cipher_key_len} to discover the maximum length of cipher key
> -    the device supports and MUST guarantee the \field{key_len} (CIPHER service or AEAD service) within
> +    the device supports and MUST guarantee the \field{key_len} (CIPHER service or AEAD service) is within
>      the \field{max_cipher_key_len} of the device configuration, otherwise the request will fail.
>  \item The driver SHOULD read \field{max_auth_key_len} to discover the maximum length of authenticated
> -    key the device supports and MUST guarantee the \field{auth_key_len} (MAC service) within the
> +    key the device supports and MUST guarantee the \field{auth_key_len} (MAC service) is within the
>      \field{max_auth_key_len} of the device configuration, otherwise the request will fail.
>  \end{itemize*}

This still seems a bit awkward. I'd make that either "MUST guarantee
(...) to be within (...)", or "MUST guarantee that (...) is within
(...)". What do you think?


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

