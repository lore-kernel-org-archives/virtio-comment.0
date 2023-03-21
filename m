Return-Path: <virtio-comment-return-4937-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C88C6FD1D
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Mar 2023 08:55:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 77237C622E
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Mar 2023 08:55:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 727C198643F
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Mar 2023 08:55:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6A2B9983DFC; Tue, 21 Mar 2023 08:55:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 58E759863AC
	for <virtio-comment@lists.oasis-open.org>; Tue, 21 Mar 2023 08:55:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 6reN1CdONUGKvHrLCcz_pg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679388939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7PacSmnXL4TMQydi5riVNEXp3mBKs8k3HM8pQJHBYB0=;
        b=xpbSfCN+02w9RijYQBQjuHNRkG/pQC9VcgX4ZiiT8CPbKWCKL7gd5nuRyog7nVLhn1
         Oy7989Jwokuz2xiisJ5L6nHcJrwJ307B0iZAdE9ewwJ5QYWBCh7fcl65Lk/dxBHalCsv
         5GOzZpp3iwt803EsKelxDkAcQawRyTepgcEkc8pVhrDXAZsQaDfKXuULGqMaoCvaNpdJ
         vtb2WK14HNX9x92yMlXgbCKcgtCtPEln+Sk4DTgSop3CgjV/ueCGK4vPdcTw38CVFBqo
         +CRP1u7P92rCmA5iQncgzxj3aly7VCruTXLZfxiQPcKyqvb3wVxH35Z7d5tgVJfxdI7e
         qHpw==
X-Gm-Message-State: AO0yUKUYnneNNFeO2CVxSAPS11VoHElTbpo0U8iC4QCr0IE0WQ0pljrM
	NTJgWuNVQN8jWunmcxbVkUpfAtfE/HotlSeW/gZkG+1QzBu7amQyPIeUpieoqwRJMbiQomPDefo
	yUuL6fy/0975FI4nqRCZBaiyG7A+f1wX9cTesycXYKA==
X-Received: by 2002:a5d:590f:0:b0:2ce:50bb:dd11 with SMTP id v15-20020a5d590f000000b002ce50bbdd11mr1564927wrd.27.1679388939173;
        Tue, 21 Mar 2023 01:55:39 -0700 (PDT)
X-Google-Smtp-Source: AK7set/iXIk/CB+CPx6plc6hTiQQ6ELaxlVGAtvgHUwLDfbHIqqyKbDOE5PFL0ZrD9dou4UUEsiHZQ==
X-Received: by 2002:a5d:590f:0:b0:2ce:50bb:dd11 with SMTP id v15-20020a5d590f000000b002ce50bbdd11mr1564913wrd.27.1679388938881;
        Tue, 21 Mar 2023 01:55:38 -0700 (PDT)
Date: Tue, 21 Mar 2023 04:55:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, pasic@linux.ibm.com, cohuck@redhat.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com
Message-ID: <20230321044737-mutt-send-email-mst@kernel.org>
References: <20230321041036.201439-1-parav@nvidia.com>
 <20230321041036.201439-8-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230321041036.201439-8-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v2 7/7] virtio-net: Describe RSS using receive queue
 handle

On Tue, Mar 21, 2023 at 06:10:36AM +0200, Parav Pandit wrote:
> The content of indirection table and unclassified_queue which are
> based on math calculation historically. To better describe this, to
> avoid intermixing array index with virtqueue index and to use virtqueue
> number
> 
> introduce a field rq_handle (receive queue handle) and refer them
> to describe unclassified_queue and indirection_table fields.
> 
> As part of it, have the example that uses non zero virtqueue
> number which helps to have better mapping between receiveX
> object with virtqueue number and the actual value in the
> indirection table.
> 
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/163
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> 
> ---
> changelog:
> v0->v1:
> - new patch suggested by Michael Tsirkin
> ---
>  device-types/net/description.tex | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index 435c1fc..fa9b4c7 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -1442,20 +1442,32 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>  \field{indirection_table} array.
>  Number of entries in \field{indirection_table} is (\field{indirection_table_mask} + 1).
>  
> -Field \field{unclassified_queue} contains the 0-based index of
> -the receive virtqueue to place unclassified packets in. Index 0 corresponds to receiveq1.
> +Field \field{unclassified_queue} contains the receive queue
> +handle \field{rq_handle} described below.
>  
> -Field \field{indirection_table} contains an array of 0-based indices of receive virtqueues. Index 0 corresponds to receiveq1.
> +Field \field{indirection_table} contains an array of receive
> +queue handles described below in \field{rq_handle}.


This is only used once, here.  I understand that we need a name
for this but it need not be so generic, I feel it's just confusing.
I propose "indirection table entry".

Thus:
	Field \field{indirection_table} contains an array of
	indirection table entries. Each indirection table entry consists of a
	vq number value divided by 2. Thus, an entry value of 3 maps to virtqueue number 6
	which corresponds to receiveq4



> For example at
> +array index 0,

why mention array index here?

> a value of 3 maps to virtqueue number 6
> +which corresponds to receiveq4.

It's a good idea to first describe a concept then provide
an example.


>  A driver sets \field{max_tx_vq} to inform a device how many transmit virtqueues it may use (transmitq1\ldots transmitq \field{max_tx_vq}).
>  
>  Fields \field{hash_key_length} and \field{hash_key_data} define the key to be used in hash calculation.
>  
> +\begin{lstlisting}
> +le16 rq_handle;
> +\end{lstlisting}
> +
> +\field{rq_handle} is a receive virtqueue handle. It is calculated as
> +virtqueue number divided by 2. For example a receive virtqueue handle
> +value of 3 corresponds to virtqueue number 6 maps to receiveq4.
> +

it's a bit disconnected from the rest of the description. why not
adjacent to it?

>  \drivernormative{\subparagraph}{Setting RSS parameters}{Device Types / Network Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS) }
>  
>  A driver MUST NOT send the VIRTIO_NET_CTRL_MQ_RSS_CONFIG command if the feature VIRTIO_NET_F_RSS has not been negotiated.
>  
> -A driver MUST fill the \field{indirection_table} array only with indices of enabled queues. Index 0 corresponds to receiveq1.
> +A driver MUST fill the \field{indirection_table} array only with
> +the \field{rq_handle} corresponding to the enabled receive virtqueues.
>  
>  The number of entries in \field{indirection_table} (\field{indirection_table_mask} + 1) MUST be a power of two.
>  
> @@ -1468,7 +1480,9 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>  \begin{itemize}
>  \item Calculate the hash of the packet as defined in \ref{sec:Device Types / Network Device / Device Operation / Processing of Incoming Packets / Hash calculation for incoming packets}.
>  \item If the device did not calculate the hash for the specific packet, the device directs the packet to the receiveq specified by \field{unclassified_queue} of virtio_net_rss_config structure.
> -\item Apply \field{indirection_table_mask} to the calculated hash and use the result as the index in the indirection table to get 0-based number of destination receiveq.
> +\item Apply \field{indirection_table_mask} to the calculated hash
> +and use the result as the index in the indirection table to get
> +\field{rq_handle}.
>  \item If the destination receive queue is being reset (See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}), the device MUST drop the packet.
>  \end{itemize}
>  
> -- 
> 2.26.2


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

