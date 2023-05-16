Return-Path: <virtio-comment-return-5932-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B70C77B7F
	for <virtio-comment@archiver.kernel.org>; Tue, 16 May 2023 04:18:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DE63417916F
	for <virtio-comment@archiver.kernel.org>; Tue, 16 May 2023 04:18:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5030A9865BD
	for <virtio-comment@archiver.kernel.org>; Tue, 16 May 2023 04:18:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 40B3C983DA0; Tue, 16 May 2023 04:18:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 05C4498676B
	for <virtio-comment@lists.oasis-open.org>; Tue, 16 May 2023 04:18:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: OpX90IdMO06kD3ngURFdYg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684210712; x=1686802712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1i+oFwOq64prLPrePOaDHSqIUpoNmnP3cge/hKF+k4=;
        b=Ns7WTitF4JbEAg0DOfE42oL//8PXKsGQc5O6flzI4gZE7BkJnuZyiQ/HLaeKBsm5Kk
         nkIb9PQLop+FNYRAh+WSJNXeYCorR4Cd6msk0ey4jUlx23VbbRAu9O1ma8O33luz7hjm
         6XOQIrZ4OdamfMqOpt9xSCYdsNJ586IX9mSHfaCFmU+DVsIUg2SkH0Se2CSZo4BdNhbb
         5u+1H6jUTSVpOwu5jeAUb67g5K2DFDg7g3owQR1bIUpZYC2VG49dSSz8KgIuzMmC4Myg
         30vJ5F4f3enylqmnpDoeQ7Q9hZwItH66Ktm9FlTcVp/0CzxiXcdL6noZ6XEQjvr5TwkY
         pIDg==
X-Gm-Message-State: AC+VfDw36/4NXSZBSm4RykX9Tuq6ZRyt+HD6MoSd6ZQMONZIMmxJoSf/
	72wXPrpewTHDPsdYinCiLtDaywxCkG57CnX5Ayb3dAJ5oKQDI6/7Hiq58O/sSqAxlcQpWJlxBE9
	6EMOI9aw8ZLpDZFxyLrGwr5lIjn9VhSY5vA==
X-Received: by 2002:adf:e4c7:0:b0:2f1:e162:d48 with SMTP id v7-20020adfe4c7000000b002f1e1620d48mr23531357wrm.47.1684210712340;
        Mon, 15 May 2023 21:18:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ77+QEkomj6eT93cs+VIu+GwePt0pbiTT6LhfM9V85f47S91/dBoHMie2bHbW/Q1drqJqPOgA==
X-Received: by 2002:adf:e4c7:0:b0:2f1:e162:d48 with SMTP id v7-20020adfe4c7000000b002f1e1620d48mr23531344wrm.47.1684210712033;
        Mon, 15 May 2023 21:18:32 -0700 (PDT)
Date: Tue, 16 May 2023 00:18:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230516001359-mutt-send-email-mst@kernel.org>
References: <20230510014534-mutt-send-email-mst@kernel.org>
 <43ec1c8d-7d11-2400-3649-1fe366b1e21b@nvidia.com>
 <20230510121417-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481F030A76141320F03956EDC779@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB5481CEB307F413E53B03D502DC779@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtm5AS50YmPi6A5=gzZZ9Jm55NEJ3GKOTzv-Z0m5E5J_w@mail.gmail.com>
 <PH0PR12MB5481DE0569EC53A862A4D2E9DC749@PH0PR12MB5481.namprd12.prod.outlook.com>
 <893b6ec0-a74f-69b7-95a3-988f0f9382a8@redhat.com>
 <PH0PR12MB5481CF52380D414AFFBA6A9FDC789@PH0PR12MB5481.namprd12.prod.outlook.com>
 <078af8e2-fb10-b33a-6751-374c4fbd09a9@redhat.com>
MIME-Version: 1.0
In-Reply-To: <078af8e2-fb10-b33a-6751-374c4fbd09a9@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v2 0/2] transport-pci: Introduce legacy registers access
 using AQ

On Tue, May 16, 2023 at 11:28:04AM +0800, Jason Wang wrote:
> > 
> > > Admin virtqueue doesn't preventing anything from letting IMS go directly to the
> > > device.
> > But there is no aq/cfgq/cmdq defined for the guest, so with current proposal it is prevented.
> 
> 
> It's a choice of the implementation but not spec. Spec doesn't say adminq
> can't be used for guest.

It actually kind of does. adminq controls group members through the
group owner.  owner is not itself a member. For a guest controlling a
member to use adminq you have to also pass the owner to guest.
Possible but not a standard architecture.

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

