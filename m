Return-Path: <virtio-comment-return-5512-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A18C6FD18
	for <virtio-comment@archiver.kernel.org>; Tue, 18 Apr 2023 11:58:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6B15FF3F40
	for <virtio-comment@archiver.kernel.org>; Tue, 18 Apr 2023 11:58:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DFAC6986743
	for <virtio-comment@archiver.kernel.org>; Tue, 18 Apr 2023 11:58:19 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 823EC98664F; Tue, 18 Apr 2023 11:58:19 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4E09F98640E
	for <virtio-comment@lists.oasis-open.org>; Tue, 18 Apr 2023 11:58:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 5Gzvg03iP8WmCF_TmQE6Cg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681819096; x=1684411096;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8TtIpQFmh6KEPWQeNckjC4fUVrBL7e4REAHDp201IZg=;
        b=lfyqkhvoRAdBL4vztJLZYQUD6yNG29wl4h4c9zzQT5Rqtvdh72i12OArdCWoBiIBWw
         eB6YIPt69ekOc1DVXClcfMRgulit7/+4R8jHEJvKQ9K53X65+mKk6Rr55x68y+055Ztr
         kAb+F/yFv/diaNVa8idbFTtcw6lTS7aFmX3TKOV21vrm3zLsV7jnw+GMHm0W5XSNFWJ/
         cylA7ao43UdtKwK+8hKvvMayhQCCS7HTErQqFl55PNhlm4wBs1j6Fhne/MSJ5LAQbJg0
         bb6Px2V+kQa3BsBv0APtvM+JnTLXUjP0XdhYuQz8APoZM/7b3ZuCNVUeDOL6++Sv3CUi
         2nmQ==
X-Gm-Message-State: AAQBX9c0TFgFc1XAK3gdUcOO8M4eN2ft6EP4XL9i/S1SwzTKU5DoGm0V
	DtyPcTafCiupTH9dmsVBna9E7lOg30iAHdoTb59MmPd5UY34Qt9cSmTwBVbMoBwx3NpjqToAYzM
	O16MI8LseCfKesSTPZnuFNlzwBYfJdhlptQ==
X-Received: by 2002:a05:6000:1107:b0:2e5:56f8:61fc with SMTP id z7-20020a056000110700b002e556f861fcmr1682423wrw.15.1681819095836;
        Tue, 18 Apr 2023 04:58:15 -0700 (PDT)
X-Google-Smtp-Source: AKy350a8+tHP80PH4qz20BxxCUu37KHorM8hFjrlBdOczuc8uIH61ZhkuIIblAgW5F+IyMiC+E2CHg==
X-Received: by 2002:a05:6000:1107:b0:2e5:56f8:61fc with SMTP id z7-20020a056000110700b002e556f861fcmr1682411wrw.15.1681819095572;
        Tue, 18 Apr 2023 04:58:15 -0700 (PDT)
Date: Tue, 18 Apr 2023 07:58:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Satananda Burla <sburla@marvell.com>,
	Maxime Coquelin <maxime.coquelin@redhat.com>,
	Yan Vugenfirer <yan@daynix.com>
Message-ID: <20230418075401-mutt-send-email-mst@kernel.org>
References: <CACGkMEvSSXyXQnRs=OiaSJnSEYHP83chL6-B5ZPCGx6TeW9W5Q@mail.gmail.com>
 <PH0PR12MB548135CF5268D979A6D8EDE8DC999@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsHtC99kTTa0TrfeJuhV+F7e-WF7XRgbLJkCBQeAxW8pA@mail.gmail.com>
 <PH0PR12MB5481C29561D5E48BA5D8AEEEDC999@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEseO=4xDA+pH2x=CaJ6XyzHEx1ZFO-+uevJH50kLeSWhA@mail.gmail.com>
 <PH0PR12MB5481FFC95F54AD048927FF12DC9C9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230417162618-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481710854882449008F28BDDC9C9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvPv7eH3+cggcCVZvRCqkNCh_CX+6azNJtdJUDxjjAjwg@mail.gmail.com>
 <PH0PR12MB548113626CD6C7B2F8589042DC9D9@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548113626CD6C7B2F8589042DC9D9@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH 09/11] transport-pci: Describe PCI
 MMR dev config registers

On Tue, Apr 18, 2023 at 01:30:43AM +0000, Parav Pandit wrote:
> 
> 
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Monday, April 17, 2023 8:37 PM
> 
> > > > > Do you mean say we have three AQs, AQ_1, AQ_2, and AQ_3;
> > > > > AQ_1 of the PF used by admin work as SIOV device create, SRIOV
> > > > > MSIX
> > > > configuration.
> > > > > AQ_2 of the PF used for transporting legacy config access of the
> > > > > PCI VF
> > > > > AQ_3 of the PF for some transport work.
> > > > >
> > > > > If yes, sounds find to me.
> > > >
> > > > Latest proposal simply leaves the split between AQs up to the driver.
> > > > Seems the most flexible.
> > > Yes. It is. Different opcode range and multiple AQs enable to do so.
> > 
> > Right, so it would be some facility that makes the transport commands of
> > modern and legacy are mutually exclusive.
> 
> Ok. I didn’t follow the mutual exclusion part.
> If a device has exposed legacy interface it will have to transport legacy access via its PF.
> Same device can be transitional, and its 1.x interface doesn’t need to through this transport channel of PF, right?

I think in any case, using device through two transports at the same
time shouldn't be legal.


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

