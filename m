Return-Path: <virtio-comment-return-8509-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5100DC61D85
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 21:18:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8A1842AEE4
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 21:18:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 676E398689F
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 21:18:42 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4C49E983CFD; Tue, 21 Nov 2023 21:18:42 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3ED37986890
	for <virtio-comment@lists.oasis-open.org>; Tue, 21 Nov 2023 21:18:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: TzwxubOZOpeJKDMK4FEnKA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700601485; x=1701206285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5gwAsRwvh/D4+v2Xs1/eg2B6G7Q1kyEg70edImpw4A=;
        b=i883FyXG/kkbCrUBM+7N+4inWcjrEFEgVevQBtUcibSh4NQ5CrOBWqGW2Ah76si0S2
         XFaFb8ax7FYSxlxIWGUVbIQIra0Np0pb2D5zcHUHOjtvlK/5Qx9HI9QY5gAIOMWGqt0/
         u9BzcgmeHxO4fK9eHbekJbWVZ3i+dAdI3EUHpSuhna4KLDjxse6roTnEjOYSOkIVtdeo
         b3noPlMBUdjNYSXnOP0xi6YT27AXR8p80UtgBy4AmzWWDU2yZy9iDUbGhDPuOzD4Fy9y
         k6GrLrIS+93lVA4dxbV+UoPaIGXTm3dgjjBoMTkhOxHEdWnR51jzSB42K0q38ZT+ZcSW
         py1w==
X-Gm-Message-State: AOJu0YyE/GY6S2tQTU9OmRoprMcB8gvTaVr3Pqi5mRFokFIsoSadHlwh
	EBHrZ/p2ENGe8JxafXbB23WcunmRgYszWCU8UBOqo0b9btlmc8U8OPlckb+oNOWaLwiPUFu4syw
	tPdqL2btthDzMJ5sIYls+LjPsiUEJdfHpCg==
X-Received: by 2002:a17:906:b212:b0:9be:e90:5016 with SMTP id p18-20020a170906b21200b009be0e905016mr97736ejz.24.1700601484784;
        Tue, 21 Nov 2023 13:18:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFd14hidU+zqY7KyQtRZySonqE+TQmLAYcrNNnE+pjPgvi9qzvlopQcCQ7T+lMEtlqhd2Uguw==
X-Received: by 2002:a17:906:b212:b0:9be:e90:5016 with SMTP id p18-20020a170906b21200b009be0e905016mr97729ejz.24.1700601484425;
        Tue, 21 Nov 2023 13:18:04 -0800 (PST)
Date: Tue, 21 Nov 2023 16:18:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20231121161218-mutt-send-email-mst@kernel.org>
References: <20231106044836-mutt-send-email-mst@kernel.org>
 <c6cb6e6b-fd2b-43ac-9be5-c4a8cda1ac13@intel.com>
 <20231108124625-mutt-send-email-mst@kernel.org>
 <b125da70-a769-4662-876b-43664e39c976@intel.com>
 <PH0PR12MB5481577C0492D45C20CF9C62DCAFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvLYgnLtSqx_G=-KMuANEZ=xtAzJjV3pYqAZhA0qqW0sQ@mail.gmail.com>
 <PH0PR12MB54819A6E470D3ABE4BC1F450DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtxm8M5vKfOPOAS347JAJNeRDyPe+nif1LszuRWS0vShQ@mail.gmail.com>
 <PH0PR12MB54810EF71D0BF925F4F81A65DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtsMi9+MgDb=tTH=LrkReb3aZdB4wv-MJkxLmLhNmTDAg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEtsMi9+MgDb=tTH=LrkReb3aZdB4wv-MJkxLmLhNmTDAg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] RE: [PATCH V2 3/6] virtio: dont reset vqs when
 SUSPEND

On Tue, Nov 21, 2023 at 03:33:07PM +0800, Jason Wang wrote:
> > Lingshan claimed that suspending device is for live migration in commit log and in discussion he portray it as some basic facility unrelated to device migration such as debug etc.
> > Instead of claiming it as some non_device_migration facility does not make sense.
> 
> It is used for migration for sure.

Well having a generic facility to stop device sounds like a nice thing.
However the devil is in the detail. A lot of detail here seems very much
tailored to a very specific implementation in mind.
So thinking through how it will work e.g. for power management
would be a good excercise to figure out how it should work in detail.
Parav did you indicate at some point a virtio specific SUSPEND
bit can be useful for PM? Could you share how it's better than
transport level PM and what the requirements are?
Thanks!

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

