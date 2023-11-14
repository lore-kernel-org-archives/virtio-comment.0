Return-Path: <virtio-comment-return-8354-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124D4C4332F
	for <virtio-comment@archiver.kernel.org>; Tue, 14 Nov 2023 08:27:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6AA9B41F2E
	for <virtio-comment@archiver.kernel.org>; Tue, 14 Nov 2023 08:27:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4DF59986D6F
	for <virtio-comment@archiver.kernel.org>; Tue, 14 Nov 2023 08:27:56 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 36972986D67; Tue, 14 Nov 2023 08:27:56 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 26AB7986D68
	for <virtio-comment@lists.oasis-open.org>; Tue, 14 Nov 2023 08:27:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: hc7EU3EsN0uydBdDPd2ygQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699950473; x=1700555273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qBEMmwjaZS+yUJd9ja1jscj1uUIfaMeRoibA1ZiaiK4=;
        b=sW+ITDcUSPNMw8GMb8WLWDctK2gTt7wG0TbkLGdtCt8KBBPFjCFjU+vRBcaq+rkAw4
         2U9ipvuZZK4+6/8HsnK8tbsmwNk6JOVZhWXO2f0RAuajWDJqA+ZFl6CxI82UtkCe5TIT
         dOSx+ldWzBXeLt0tcI4cA0qktWfUAKyhGzhUe1vI9iuKkJJDQ3Q+xPkclJdAz0YlFX8S
         2rZOWHkhvoYDftS3x8Ca3C8YzBx2Lgre3ELdRSLp3WR9Vt5UR92nJujh4J6lMIOq/u/c
         OssPj0fFWGtK42jbLXwz9EJ7iqHRezV5nkyfQtPT8VeoolJ2iArUAH2eK7Stic1MIzXN
         wUrQ==
X-Gm-Message-State: AOJu0YwDczAVBsRo/+vHCRhZUrZ9mvtWBckL/op8PlMQRD66HRzafDy0
	fvRcP0dqtJOEaAjMQgslqLUJaoLf34hF7iW0/1OD5Y4fyhxwZUYgc7oHZd6BFAu5a2gHctNowL7
	3KusL0U6xVKSTbQQIKFKxGI1AhP2Nss0R0w==
X-Received: by 2002:a17:906:370f:b0:9e5:d313:fee7 with SMTP id d15-20020a170906370f00b009e5d313fee7mr6258936ejc.50.1699950473169;
        Tue, 14 Nov 2023 00:27:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxFnkV7eX6edmfQTUncL3DHl98pM0tjiWgQ3FgccwOG+zLGnJeKyblP5yaBokHlQLETCx+Hw==
X-Received: by 2002:a17:906:370f:b0:9e5:d313:fee7 with SMTP id d15-20020a170906370f00b009e5d313fee7mr6258834ejc.50.1699950469050;
        Tue, 14 Nov 2023 00:27:49 -0800 (PST)
Date: Tue, 14 Nov 2023 03:27:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Jason Wang <jasowang@redhat.com>, Parav Pandit <parav@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231114032553-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB548152A30021BEBFFCA62AA9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
 <20231107015412-mutt-send-email-mst@kernel.org>
 <CACGkMEv+jir2+f_vHmi_KjFXf0yz+EQmEbvzX0pheHKsVJkWZw@mail.gmail.com>
 <20231108025854-mutt-send-email-mst@kernel.org>
 <CACGkMEvkQawXWCvu7rZHnZk8YsNunS_B-fcQmEHEe_N87Q6y6g@mail.gmail.com>
 <20231109022647-mutt-send-email-mst@kernel.org>
 <CACGkMEuSpZ0Y8kxXv26b38pvX--OCdvWm5KvMniqo=W10ruBTA@mail.gmail.com>
 <20231113013016-mutt-send-email-mst@kernel.org>
 <9952859f-1b72-46bf-b386-7c3f5c69269f@intel.com>
MIME-Version: 1.0
In-Reply-To: <9952859f-1b72-46bf-b386-7c3f5c69269f@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of operation for write
 recording commands

On Tue, Nov 14, 2023 at 03:34:32PM +0800, Zhu, Lingshan wrote:
> > > So I can't
> > > believe it has good performance overall. Logging via IOMMU or using
> > > shadow virtqueue doesn't need any extra PCI transactions at least.
> > On the other hand they have an extra CPU cost.  Personally if this is
> > coming from a hardware vendor, I am inclined to trust them wrt PCI
> > transactions.  But anyway, discussing this at a high level theoretically
> > is pointless - whoever bothers with actual prototyping for performance
> > testing wins, if no one does I'd expect a back of a napkin estimate
> > to be included.
> if so, Intel has released productions implementing these interfaces years
> ago,
> see live migration in 4.1. IFCVF vDPA Implementation,
> https://doc.dpdk.org/guides-21.11/vdpadevs/ifc.html
> and

That one is based on shadow queue, right? Which I think this shows
is worth supporting.

> But I still believe we are here try our best to work out an industrial spec
> with better quality, to serve broad interest. This is not competition
> between companies,
> and the spec is not a FIFO, not like a early bird can catch all the worm.


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

