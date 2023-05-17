Return-Path: <virtio-comment-return-5961-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F31EC77B7D
	for <virtio-comment@archiver.kernel.org>; Wed, 17 May 2023 05:44:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2ADBCF3F5F
	for <virtio-comment@archiver.kernel.org>; Wed, 17 May 2023 05:44:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1A0FC9865A6
	for <virtio-comment@archiver.kernel.org>; Wed, 17 May 2023 05:44:47 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 11462983DFC; Wed, 17 May 2023 05:44:47 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EA01E986319
	for <virtio-comment@lists.oasis-open.org>; Wed, 17 May 2023 05:44:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: gXSXxGT0OxWYmcD3LllZOg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684302276; x=1686894276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyLFJDEmnS8gP1P2TSEeeWkOW8BcxQb6Efe2a+tsk+I=;
        b=aWhYWQZRKhkbiAFQ/gTAyedZ1rAbcle0CbsqjjJRZWpvExbJmWQK5sJDFXR7l1kBKF
         s88OmYe4PGdzsvu9OdtlRSnzG1NsO/6SHlFRBk+y5GjH+Tar+i6PgxtRIvfLJBY+wD4i
         hFdx3LImZt/327Q1QubXRKkbJrC9pfHvJwTwUhRHMweeQvzU5A3EmcTuk7ZAuKGjIktG
         9O88mQ3ob/c55a2B3DmzjO58CKO9iFLoU2vi68PQiiJbaPhmY4b+yCvOv7IPTHuSZXqG
         Rt3ua8UqpfrPAnOubFTlpnFuhW4xc5JFS0M7CIghLqTzYAfBog0bNBa6KA3WILhejR3n
         69QQ==
X-Gm-Message-State: AC+VfDwyoA9grqsX8Tqas6MygpSEGTSNEI0C2BFX4Zjfpa8PZG4nrAAK
	AaF9Y7ZsCASqhmXrv6DbfqRv/sD3GPxjk7wn01wvfITq8l+M6Xu0yTG1hLeJSojeyTlQIWC0bbp
	oSBFFfMIZfeXcoXzO5+H8SLw8t+t74IIfYA==
X-Received: by 2002:a05:600c:35c5:b0:3f4:1848:4dff with SMTP id r5-20020a05600c35c500b003f418484dffmr718461wmq.7.1684302276452;
        Tue, 16 May 2023 22:44:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Fx9bgCXxc/ehCPq22F1lMpkeA/FlyAiWtNn0YuQDTtrgUJfQCN7zG9MPky3z9G6/WKDP5GQ==
X-Received: by 2002:a05:600c:35c5:b0:3f4:1848:4dff with SMTP id r5-20020a05600c35c500b003f418484dffmr718450wmq.7.1684302276187;
        Tue, 16 May 2023 22:44:36 -0700 (PDT)
Date: Wed, 17 May 2023 01:44:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, cohuck@redhat.com,
	david.edmondson@oracle.com, sburla@marvell.com, jasowang@redhat.com,
	yishaih@nvidia.com, maorg@nvidia.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com
Message-ID: <20230517013839-mutt-send-email-mst@kernel.org>
References: <20230506000135.628899-1-parav@nvidia.com>
 <20230506000135.628899-2-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230506000135.628899-2-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v2 1/2] transport-pci: Introduce legacy registers access
 commands

On Sat, May 06, 2023 at 03:01:34AM +0300, Parav Pandit wrote:
> +\begin{lstlisting}
> +struct virtio_admin_cmd_lreg_wr_data {
> +	u8 offset; /* Starting byte offset of the register(s) to write */
> +	u8 register[];
> +};
> +\end{lstlisting}

So to summarize, I think the main comment here was to have separate
commands for access to common versus device config. Just today I thought
some more and came up with another reason why this is a good idea: if we
ever want legacy MMIO emulation, we can reuse the device config command.

Jason also feels the common config command can be shared
with vq transport effort. We can discuss this, for sure,
I guess its putting code in hardware versus in hypervisor,
but if there are hardware vendors who strictly want
this code in hardware I don't have a big problem with this
even if I don't exactly get why.

With this idea all hypervisor has to do is subtract the offset from
device config access, sounds like a small price to pay.  Does this sound
like a reasonable compromize to you?

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

