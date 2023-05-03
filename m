Return-Path: <virtio-comment-return-5731-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717A2C77B75
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 19:21:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C6E7515B664
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 19:21:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C145A9866C5
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 19:21:54 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B97189865F0; Wed,  3 May 2023 19:21:54 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A63579866B1
	for <virtio-comment@lists.oasis-open.org>; Wed,  3 May 2023 19:21:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: JJ8bsCOHO4OV7qjcBumXMQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683141707; x=1685733707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8MbwsKW+Wd4vLqhW2fMXV4984+gwPp+Hk825RieqPU=;
        b=IKpCJyua8yJCanc+4wjiKdvyk0jZjtS0uwKIZgAXo6VOyJ9WkQ1D/gj6msG4T2ujMF
         44pfrp7repwMFxd6N4PyvaVqOo6sysODa2ody/pXvgWZw5HKFW1IZzOBRZXIcicWi0y6
         +S8glf2mfOiMIn2YSgIdSx5C2k080pL0K5yjwdEwYajOKlRXMprKFveDNJQbw9lsUrEO
         611zB+ACSedHJsg07oaFWa30Nlmms/LtT/LOU5olIndzlc08LpyO98z89A0bTXgDg4Ok
         Fxspi095M90xT4fjYiOlaND3MN3Kj0R3bCBcBRlPzfRi5Bfg4a3+Qf0HhVlpqcpPHBNn
         8XLQ==
X-Gm-Message-State: AC+VfDxbSD4FQ5Ca8osAphxsLgi0stWQjPhuWwW4aJnuYZ3ycaWOKO3e
	BqFMiUveCZLlrrb4d3blkbz0wwGoYV1kbyxkhnqf4MonBcBFZ9Jva5571KTq+9BbKH/oxI9auxt
	qXIdJrH2l9EhhDd7kq3QKaMPGOfZtBxHeUQ==
X-Received: by 2002:a5d:668e:0:b0:2d2:f3e3:115d with SMTP id l14-20020a5d668e000000b002d2f3e3115dmr590299wru.59.1683141707376;
        Wed, 03 May 2023 12:21:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6fenEIDmmCVG05nfObcOOBbyUdX/9dLVyxZvfUGbZvEmmKCnebgWVpsTAp3ZCqORvbfqbRdg==
X-Received: by 2002:a5d:668e:0:b0:2d2:f3e3:115d with SMTP id l14-20020a5d668e000000b002d2f3e3115dmr590290wru.59.1683141707056;
        Wed, 03 May 2023 12:21:47 -0700 (PDT)
Date: Wed, 3 May 2023 15:21:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, cohuck@redhat.com,
	david.edmondson@oracle.com, sburla@marvell.com, jasowang@redhat.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com
Message-ID: <20230503151908-mutt-send-email-mst@kernel.org>
References: <20230503032659.530330-1-parav@nvidia.com>
 <20230503032659.530330-2-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230503032659.530330-2-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v1 1/2] transport-pci: Introduce legacy registers access
 commands

On Wed, May 03, 2023 at 06:26:58AM +0300, Parav Pandit wrote:
> +\begin{lstlisting}
> +struct virtio_admin_cmd_lreg_wr_data {
> +	u8 offset; /* Starting byte offset of the register(s) to write */
> +	u8 size; /* Number of bytes to write into the register. */
> +	u8 register[];
> +};

BTW if we don't have padding we could reuse buffer size and won't need
size here.  Do we want to tweak admin command structure generally to use
u8 and not le64 for command data then? WDYT?

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

