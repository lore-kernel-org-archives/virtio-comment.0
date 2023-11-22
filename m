Return-Path: <virtio-comment-return-8538-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A78C072A2
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 06:50:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9D00E33582
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 06:50:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6406A9868A6
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 06:50:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 41A189843C0; Wed, 22 Nov 2023 06:50:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BFCF4986894
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Nov 2023 06:49:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: P0JrMIAVM96UsufIM-dhgA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700635795; x=1701240595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZeGsilpYA0jy4Mu3vHBM+qvY3RS8+SOM+9z3dKcxwOs=;
        b=TltDgqE7YmnsAyrwMI91NAVyWZ0uze9caDexDEL3WdABoTHNRtupypYh+6Ffh0aiaz
         1u/lX9H9Qmgn4vLU0/Nl9tmcxt6ibe28VNXhyGaxnMGqYvWHSf0F4i1y0Jn5j/vQoddp
         kRchvg7TYq7Xzuhi3/s6dVtPE9XO9C+NstXeIv23GUR/IwK8Z5efcFXO2VEIF08NH93H
         8RfmcbuaEhLeduWXOQ44dwO+6DDff6WSAjKfgbeVJB8hDvDUv2AI+0OEyobknfOlF4La
         LccMBxBTlIB6lH3G5pSarTPFXoLwBFEVpe7f+UnKu4HbtM6OmPu7QtLHitRn2ONtMZlq
         KIvQ==
X-Gm-Message-State: AOJu0YxosHJ8Wwa9aiergvaBg13zjY3yyMtsjaie8LiUElk3PpkLjKqT
	KvEEtPYmLl9KenTW20pLwKB9zyWmGO8dmMAjkugFJjQxVjKBVEpGMEHGQLgGG0pKFOMwLwUJJ8D
	xA46sOsAIY8g2awwWu7OsQpmniaRA3OFoaA==
X-Received: by 2002:a17:906:1855:b0:a00:8706:c82b with SMTP id w21-20020a170906185500b00a008706c82bmr664468eje.47.1700635795407;
        Tue, 21 Nov 2023 22:49:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGtO9LduRZ9ivGI/Uk6mIGoWVwb3rswc/SmcFgnwQydlkOgtaElaKsgmIxxdsFUQXMYPy/kCw==
X-Received: by 2002:a17:906:1855:b0:a00:8706:c82b with SMTP id w21-20020a170906185500b00a008706c82bmr664450eje.47.1700635794980;
        Tue, 21 Nov 2023 22:49:54 -0800 (PST)
Date: Wed, 22 Nov 2023 01:49:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Jason Wang <jasowang@redhat.com>, Parav Pandit <parav@nvidia.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20231122013133-mutt-send-email-mst@kernel.org>
References: <20231108124625-mutt-send-email-mst@kernel.org>
 <b125da70-a769-4662-876b-43664e39c976@intel.com>
 <PH0PR12MB5481577C0492D45C20CF9C62DCAFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvLYgnLtSqx_G=-KMuANEZ=xtAzJjV3pYqAZhA0qqW0sQ@mail.gmail.com>
 <PH0PR12MB54819A6E470D3ABE4BC1F450DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtxm8M5vKfOPOAS347JAJNeRDyPe+nif1LszuRWS0vShQ@mail.gmail.com>
 <PH0PR12MB54810EF71D0BF925F4F81A65DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtsMi9+MgDb=tTH=LrkReb3aZdB4wv-MJkxLmLhNmTDAg@mail.gmail.com>
 <20231121161218-mutt-send-email-mst@kernel.org>
 <7e440ddc-1765-406c-80b4-6a486ec2a232@intel.com>
MIME-Version: 1.0
In-Reply-To: <7e440ddc-1765-406c-80b4-6a486ec2a232@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] RE: [PATCH V2 3/6] virtio: dont reset vqs when
 SUSPEND

On Wed, Nov 22, 2023 at 09:51:45AM +0800, Zhu, Lingshan wrote:
> 
> 
> On 11/22/2023 5:18 AM, Michael S. Tsirkin wrote:
> > On Tue, Nov 21, 2023 at 03:33:07PM +0800, Jason Wang wrote:
> > > > Lingshan claimed that suspending device is for live migration in commit log and in discussion he portray it as some basic facility unrelated to device migration such as debug etc.
> > > > Instead of claiming it as some non_device_migration facility does not make sense.
> > > It is used for migration for sure.
> > Well having a generic facility to stop device sounds like a nice thing.
> > However the devil is in the detail. A lot of detail here seems very much
> > tailored to a very specific implementation in mind.
> > So thinking through how it will work e.g. for power management
> > would be a good excercise to figure out how it should work in detail.
> > Parav did you indicate at some point a virtio specific SUSPEND
> > bit can be useful for PM? Could you share how it's better than
> > transport level PM and what the requirements are?
> > Thanks!
> Do you mean letting the device enter a new power state when SUSPEND,
> and such description in transport-pci.tex? Then resume normal
> state on DRIVER_OK.

That would be one example.

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

