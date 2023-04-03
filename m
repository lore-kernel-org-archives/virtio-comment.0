Return-Path: <virtio-comment-return-5139-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7034C76196
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 14:53:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 05C7675983
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 14:53:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E6DD49863DE
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 14:53:27 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DB15F9863D6; Mon,  3 Apr 2023 14:53:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C9A6C9863DD
	for <virtio-comment@lists.oasis-open.org>; Mon,  3 Apr 2023 14:53:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Fep6Pn8EPx-MWYJCxjD0Vg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680533605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SoKuATI9FxVQO65JzFGpn9MhU21ysHDKm1K9czzMNYg=;
        b=EUhOnNsIkTRgrLmFAv4cHqNKzRlgLfQVwSQxnN9TylWxV86KguykZ9RrWqDXWFsO/B
         ECoFnPdCsH7tWAXsK2GZOuV4L3D2AaQSXxfckqmrmss1ak8kID+eO8uC7t9cN6u6h6FN
         femRYMQdKKRCTcw9Ck1fz1eUM+3cpsJZKma0AN8cZjfD3GGOsnwZ+36VPaNYUm3TjUJj
         l7vF/FjQxvCTvGZ5lkHk+C0huihWE4G1V3KqL5b0z9Yi+zOkWfJB7RO0WYIqnozJVHw8
         nuXnNKZOmL0pE/tmEIQVxRU88cqyBd2sdYBj0k/bDA7ZqlGlxD4l2aa4LJPqqsTTbrQJ
         m20g==
X-Gm-Message-State: AAQBX9dfb/RJV85nzgNdGiuNzWNV6gbmzH6hn4fhGmRhbfpPSatozw1N
	khPh96BTzA1pjd3cxsWWNLmgdPqI3XAt9lnYH70qJc6G0lNDDpUa9MgGPEukmx5GYtrl7ahsG1e
	i8VnVduEqZPdZumlO61GeanI3YQDTsGJM/g==
X-Received: by 2002:a17:907:d68f:b0:92f:924b:e8f4 with SMTP id wf15-20020a170907d68f00b0092f924be8f4mr35220188ejc.4.1680533605002;
        Mon, 03 Apr 2023 07:53:25 -0700 (PDT)
X-Google-Smtp-Source: AKy350ayLjEdhgpD+OvJ3wRofQa/ioptBciguqBLEuSy8clBRwFQdP5IyIadfMvcARXhoPXwrs2gsw==
X-Received: by 2002:a17:907:d68f:b0:92f:924b:e8f4 with SMTP id wf15-20020a170907d68f00b0092f924be8f4mr35220173ejc.4.1680533604745;
        Mon, 03 Apr 2023 07:53:24 -0700 (PDT)
Date: Mon, 3 Apr 2023 10:53:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, cohuck@redhat.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com
Message-ID: <20230403105050-mutt-send-email-mst@kernel.org>
References: <20230330225834.506969-1-parav@nvidia.com>
 <20230331024500-mutt-send-email-mst@kernel.org>
 <0dcd9907-4bb0-ef0d-678d-5bc8f0ded9ec@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <0dcd9907-4bb0-ef0d-678d-5bc8f0ded9ec@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH 00/11] Introduce transitional mmr pci device

On Fri, Mar 31, 2023 at 05:43:11PM -0400, Parav Pandit wrote:
> > I can not say I thought about this
> > deeply so maybe there's some problem, or maybe it's a worse approach -
> > could you comment on this? It looks like this could be a smaller change,
> > but maybe it isn't? Did you consider this option?
> 
> We can possibly let both the options open for device vendors to implement.
> 
> Change wise transport VQ is fairly big addition for both hypervisor driver
> and also for the device.

OTOH it is presumably required for scalability anyway, no?
And presumably it can all be done in firmware ...
Is there actual hardware that can't implement transport vq
but is going to implement the mmr spec?

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

