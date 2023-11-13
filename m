Return-Path: <virtio-comment-return-8348-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E289C4332F
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Nov 2023 14:30:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2DE9826A36
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Nov 2023 14:30:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 01AE9986821
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Nov 2023 14:30:57 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DCB31986814; Mon, 13 Nov 2023 14:30:56 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CC471986815
	for <virtio-comment@lists.oasis-open.org>; Mon, 13 Nov 2023 14:30:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: U5MDh0mVN2y6wMhfGINKjA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699885853; x=1700490653;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cCru2jtrs5JzTnSJd6iIrKz8NdUunECaf82XjWi+128=;
        b=dIDCei3yv1kDK6Ng0f5NbEAJ3GOqJXCkkXxLVkj69wPnj9DT23l0LZnbatSa7MEvtc
         GyViCFD/5EygKQ2pdECL7j61shMsa/Q0xthVR2asp4N7J9AK/PfcBMaS2XTGZWvyo/8C
         A0am8I+LI58S+ZM60nBFkzqRw801moXH3PYGOYIXIvSZoZdf+pF0ABVjUok5BZGjDWmU
         FvOaUP2/Z5CzwJYq3ATRczUe4YMu4Qa9gem0MkMn8xUitLpCaB1dq/Rzea2gHPhIBJUn
         92lkXyG14DrGxc1nZefs6Ysixf0AZEYjxYRWKRXQ465HCZ+llIWI5wDEs5WGysCXSPi7
         W2Jw==
X-Gm-Message-State: AOJu0YzUjpbWpgdf/CcsNyA9CggeftiReufjKZdUDDooC1ovyQQG7D8z
	pvXkeEEHHU0dwi2FbGL8Dj2Oii4hzvYE9OsC/fSSduCl+whiDCjUAUwnO8S6HQoo3YLvus52iUR
	HYXcaxGoOXwuMuqt3xNH0Imea7SXXHMq3FA==
X-Received: by 2002:a5d:47ca:0:b0:32d:82d8:3442 with SMTP id o10-20020a5d47ca000000b0032d82d83442mr7220221wrc.53.1699885853651;
        Mon, 13 Nov 2023 06:30:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHt9YPEQyxzAps3BvOFn0Hcgo1VlkUcupfiyu9iO4oachaugaeAWyDRxoxaOPI9WdTF+7Cqrg==
X-Received: by 2002:a5d:47ca:0:b0:32d:82d8:3442 with SMTP id o10-20020a5d47ca000000b0032d82d83442mr7220198wrc.53.1699885853290;
        Mon, 13 Nov 2023 06:30:53 -0800 (PST)
Date: Mon, 13 Nov 2023 09:30:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Message-ID: <20231113015854-mutt-send-email-mst@kernel.org>
References: <CACGkMEtGvDxF1Dnb6FJDK8XEAUcast-7OnuzTyfAr7m0LURWMw@mail.gmail.com>
 <PH0PR12MB548152A30021BEBFFCA62AA9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
 <20231107015412-mutt-send-email-mst@kernel.org>
 <CACGkMEv+jir2+f_vHmi_KjFXf0yz+EQmEbvzX0pheHKsVJkWZw@mail.gmail.com>
 <20231108025854-mutt-send-email-mst@kernel.org>
 <CACGkMEvkQawXWCvu7rZHnZk8YsNunS_B-fcQmEHEe_N87Q6y6g@mail.gmail.com>
 <20231109022647-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813C84CFA5601DB1B47885DCAEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu-Zs-dxcYRjtV+hLBVy5Tv9JzgT2c83Zjzt7A-a1QR2A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEu-Zs-dxcYRjtV+hLBVy5Tv9JzgT2c83Zjzt7A-a1QR2A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of operation for write
 recording commands

On Mon, Nov 13, 2023 at 11:41:07AM +0800, Jason Wang wrote:
> On Fri, Nov 10, 2023 at 2:46 PM Parav Pandit <parav@nvidia.com> wrote:
> >
> > Hi Michael,
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Thursday, November 9, 2023 1:29 PM
> >
> > [..]
> > > > Besides the issue of performance, it's also racy, assuming we are logging
> > > IOVA.
> > > >
> > > > 0) device log IOVA
> > > > 1) hypervisor fetches IOVA from log buffer
> > > > 2) guest map IOVA to a new GPA
> > > > 3) hypervisor traverse guest table to get IOVA to new GPA
> > > >
> > > > Then we lost the old GPA.
> > >
> > > Interesting and a good point. And by the way e.g. vhost has the same issue.  You
> > > need to flush dirty tracking info when changing the mappings somehow.  Parav
> > > what's the plan for this? Should be addressed in the spec too.
> > >
> > As you listed the flush is needed for vhost or device-based DPT.
> 
> What does DPT mean? Device Page Table? Let's not invent terminology
> which is not known by others please.
> 
> We have discussed it many times. You can't just depend on ATS or
> reinventing wheels in virtio.
> 
> What's more, please try not to give me the impression that the
> proposal is optimized for a specific vendor (like device IOMMU
> stuffs).

Devices with IOMMU exist.
So if it's for device IOMMU that's fine, as long as it's well isolated.


> > The necessary plumbing is already covered for this in the query (read and clear) command of this v3 proposal.
> 
> The issue is logging via IOVA ... I don't see how "read and clear" can help.
> 
> > It is listed in Device Write Records Read Command.
> 
> Please explain how your proposal can solve the above race.
> 
> >
> > When the page write record is fully read, it is flushed.
> > How/when to use, I think its hypervisor specific, so we probably better off not documenting those details.
> 
> Well, as the author of this proposal, at least you need to know how a
> hypervisor can work with your proposal, no?
> 
> > May be such read is needed in some other path too depending on how hypervisor implemented.
> 
> What do you mean by "May be ... some other path" here? You're
> inventing a mechanism that you don't know how a hypervisor can use?
> 
> Thanks


It seems like a subtle enough race that it really should be documented.

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

