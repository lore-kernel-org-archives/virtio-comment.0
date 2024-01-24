Return-Path: <virtio-comment-return-9003-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2311BC46CD2
	for <virtio-comment@archiver.kernel.org>; Wed, 24 Jan 2024 10:50:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 58FD92AEE5
	for <virtio-comment@archiver.kernel.org>; Wed, 24 Jan 2024 10:50:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2F73F9867E7
	for <virtio-comment@archiver.kernel.org>; Wed, 24 Jan 2024 10:50:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 064DC9867D7; Wed, 24 Jan 2024 10:50:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B36B49867D8
	for <virtio-comment@lists.oasis-open.org>; Wed, 24 Jan 2024 10:50:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: zFndta4mNtKIXqDYlAQm7g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706093429; x=1706698229;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8IE5sMUD76Grvs6BFQ48De+MffjP2os5sAU/HUimPjQ=;
        b=kwfB6JL2oc/cDjFTA5YHSb7cvuO3gJkGIhL9sNo86qSAfUuHxi9KC/l4JWQb/qmtWJ
         YOQ3VMazRM6JMIug1yjBwdVSNlCvvyy1XjiZQh/zJay1zJ2Juv6O6TehkfImh1pCSsrW
         BE09iqBdeyrZ53dI9h2bCd0j76SRAryae9S1ozw8XdjLEVmyJojrEpmFoOwMPM/j/NHk
         53CcRt5PZx3GAf1/XndbxJipNdgE/yCm2rFR4LdZb2M+EwWx5Lly6jajKoXRDGM0881V
         4EhW6mhI8h80SGEosvAMl3G1WubMoAxyALxpeTn1BAgT/9Jn7Qa8zynQoQjScS3/H9Eb
         kInQ==
X-Gm-Message-State: AOJu0Yz/8JPh3ceO6GieQRE4Ym2e94xpwCwAMx6/m/ScOnIfZ92IK7RD
	dZarxKm0XHaIZDoQ8vhnXFl/jTK6He9XmG6ULO3qTR4M2ChmN1Yeit5ti5jWIf72JGSejJTZww5
	/0EjgV7XImhhgmN2bzCuIZBD+lvVCzqa4ns2b8vENkc3DyTiwQEXmvTjs1Y8MmiREViLLUq4=
X-Received: by 2002:a17:906:794a:b0:a31:301c:704d with SMTP id l10-20020a170906794a00b00a31301c704dmr608660ejo.32.1706093428700;
        Wed, 24 Jan 2024 02:50:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGH2vyJLFuYhTSIEdl0FakTntLzeSW+ZqhzpnxCPq6vfpPHOaz4tKm9DNP1R+oIowsspzlGbg==
X-Received: by 2002:a17:906:794a:b0:a31:301c:704d with SMTP id l10-20020a170906794a00b00a31301c704dmr608646ejo.32.1706093428259;
        Wed, 24 Jan 2024 02:50:28 -0800 (PST)
Date: Wed, 24 Jan 2024 05:50:23 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-ID: <20240124054505-mutt-send-email-mst@kernel.org>
References: <1705323962-96063-1-git-send-email-hengqi@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <1705323962-96063-1-git-send-email-hengqi@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v2] virtio-net: support setting coalescing params for
 multiple vqs

On Mon, Jan 15, 2024 at 09:06:02PM +0800, Heng Qi wrote:
> Currently, when each time the driver attempts to update the coalescing parameters
> for a vq, it needs to kick the device and wait for the ctrlq response to return.
> The following path is observed: 1. Driver kicks the device; 2. After the device
> receives the kick, CPU scheduling occurs and DMA multiple buffers multiple times;
> 3. The device completes processing and replies with a response.
> 
> When large-queue devices issue multiple requests and kick the device frequently,
> this often interrupt the work of the device-side CPU. In addition, each vq request
> is processed separately, causing more delays for the CPU to wait for the DMA
> request to complete.
> 
> These interruptions and overhead will strain the CPU responsible for controlling
> the path of the DPU, especially in multi-device and large-queue scenarios.
> 
> To solve the above problems, we internally tried batch request, which merges
> requests from multiple queues and sends them at once. We conservatively tested
> 8 queue commands and sent them together. The DPU processing efficiency can be
> improved by 8 times, which greatly eases the DPU's support for multi-device
> and multi-queue DIM.
> 
> Maintainers may be concerned about whether the batch command method can optimize
> the above problems: accumulate multiple request commands to kick the device once,
> and obtain the processing results of the corresponding commands asynchronously.
> The batch command method is used by us to optimize the CPU overhead of the DIM
> worker caused by the guest being busy waiting for the command response result.
> This is a different focus than batch request to solve the problem.
> 
> Suggested-by: Xiaoming Zhao <zxm377917@alibaba-inc.com>
> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> ---
> v1->v2: Updated commit log. Due to sensitivity, sorry that can not give the
>     absolute value directly. @Michael
> 
>  device-types/net/description.tex | 26 ++++++++++++++++++++------
>  1 file changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index aff5e08..b3766c4 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -1667,8 +1667,8 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>  for notification coalescing.
>  
>  If the VIRTIO_NET_F_VQ_NOTF_COAL feature is negotiated, the driver can
> -send commands VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET and VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET
> -for virtqueue notification coalescing.
> +send commands VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET, VIRTIO_NET_CTRL_NOTF_COAL_VQS_SET and
> +VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET for virtqueue notification coalescing.
>  
>  \begin{lstlisting}
>  struct virtio_net_ctrl_coal {
> @@ -1682,11 +1682,17 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>      struct virtio_net_ctrl_coal coal;
>  };
>  
> +struct virtio_net_ctrl_mrg_coal_vq {
> +        le16 num_entries; /* indicates number of valid entries */
> +        struct virtio_net_ctrl_coal_vq entries[];
> +};
> +
>  #define VIRTIO_NET_CTRL_NOTF_COAL 6
>   #define VIRTIO_NET_CTRL_NOTF_COAL_TX_SET  0
>   #define VIRTIO_NET_CTRL_NOTF_COAL_RX_SET 1
>   #define VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET 2
>   #define VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET 3
> + #define VIRTIO_NET_CTRL_NOTF_COAL_VQS_SET 4
>  \end{lstlisting}
>  
>  Coalescing parameters:
> @@ -1706,6 +1712,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>  \item For the command VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET, the structure virtio_net_ctrl_coal_vq is write-only for the driver.
>  \item For the command VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET, \field{vq_index} and \field{reserved} are write-only
>        for the driver, and the structure virtio_net_ctrl_coal is read-only for the driver.
> +\item For the command VIRTIO_NET_CTRL_NOTF_COAL_VQS_SET, the structure virtio_net_ctrl_mrg_coal_vq is write-only for the driver.
>  \end{itemize}
>  
>  The class VIRTIO_NET_CTRL_NOTF_COAL has the following commands:
> @@ -1716,6 +1723,9 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>                                          for an enabled transmit/receive virtqueue whose index is \field{vq_index}.
>  \item VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET: use the structure virtio_net_ctrl_coal_vq to get the \field{max_usecs} and \field{max_packets} parameters
>                                          for an enabled transmit/receive virtqueue whose index is \field{vq_index}.
> +\item VIRTIO_NET_CTRL_NOTF_COAL_VQS_SET: use the structure virtio_net_ctrl_mrg_coal_vq to set the \field{max_usecs} and \field{max_packets} parameters
> +                                         for \field{num_entries} enabled transmit/receive virtqueues. The corresponding index value
> +                                         of each configured virtqueue is \field{vq_index}.
>  \end{enumerate}
>  
>  The device may generate notifications more or less frequently than specified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
> @@ -1782,9 +1792,13 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>  
>  The driver MUST set \field{vq_index} to the virtqueue index of an enabled transmit or receive virtqueue.
>  
> +The driver MUST set \field{num_entries} to a non-zero value and MUST NOT set \field{num_entries} to
> +a value greater than the number of enabled transmit and receive virtqueues.
> +
>  The driver MUST have negotiated the VIRTIO_NET_F_NOTF_COAL feature when issuing commands VIRTIO_NET_CTRL_NOTF_COAL_TX_SET and VIRTIO_NET_CTRL_NOTF_COAL_RX_SET.
>  
> -The driver MUST have negotiated the VIRTIO_NET_F_VQ_NOTF_COAL feature when issuing commands VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET and VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET.
> +The driver MUST have negotiated the VIRTIO_NET_F_VQ_NOTF_COAL feature when issuing commands
> +VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET, VIRTIO_NET_CTRL_NOTF_COAL_VQS_SET and VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET.
>  
>  The driver MUST ignore the values of coalescing parameters received from the VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET command if the device responds with VIRTIO_NET_ERR.
>  
> @@ -1794,10 +1808,10 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>  
>  The device SHOULD respond to VIRTIO_NET_CTRL_NOTF_COAL_TX_SET and VIRTIO_NET_CTRL_NOTF_COAL_RX_SET commands with VIRTIO_NET_ERR if it was not able to change the parameters.
>  
> -The device MUST respond to the VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET command with VIRTIO_NET_ERR if it was not able to change the parameters.
> +The device MUST respond to VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET and VIRTIO_NET_CTRL_NOTF_COAL_VQS_SET commands with VIRTIO_NET_ERR if it was not able to change the parameters.

This one however is vague.
In fact the addition of VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET made
VIRTIO_NET_CTRL_NOTF_COAL_TX_SET and VIRTIO_NET_CTRL_NOTF_COAL_RX_SET
also vague we just missed this.



So, it is not clear whether if the device responds with VIRTIO_NET_ERR - it can change
parameters for some VQs but not others, or does it have to either
change parameters for all VQs or none at all.

I think a better sematic is all or nothing.

So I suggest combining this statement with one of
VIRTIO_NET_CTRL_NOTF_COAL_TX_SET and VIRTIO_NET_CTRL_NOTF_COAL_RX_SET,
and adding something like
"in this case, coalescing parameters MUST remain unchanged, 
for all VQs".

This bug bothers me. Maybe we should fix it before release?

I also don't know why we repeat same text for VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET,
VIRTIO_NET_CTRL_NOTF_COAL_TX_SET and VIRTIO_NET_CTRL_NOTF_COAL_RX_SET.

>  
> -The device MUST respond to VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET and VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET commands with
> -VIRTIO_NET_ERR if the designated virtqueue is not an enabled transmit or receive virtqueue.
> +The device MUST respond to VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET, VIRTIO_NET_CTRL_NOTF_COAL_VQS_SET and VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET
> +commands with VIRTIO_NET_ERR if the designated virtqueue is not an enabled transmit or receive virtqueue.
>  
>  Upon disabling and re-enabling a transmit virtqueue, the device MUST set the coalescing parameters of the virtqueue
>  to those configured through the VIRTIO_NET_CTRL_NOTF_COAL_TX_SET command, or, if the driver did not set any TX coalescing parameters, to 0.
> -- 
> 1.8.3.1


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

