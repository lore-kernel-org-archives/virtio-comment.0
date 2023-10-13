Return-Path: <virtio-comment-return-7712-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62146CDB47E
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 11:28:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B4703EEA10
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 11:28:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 93BE4986838
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 11:28:49 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8384E9865D9; Fri, 13 Oct 2023 11:28:49 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7403B986836
	for <virtio-comment@lists.oasis-open.org>; Fri, 13 Oct 2023 11:28:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: CkdcKu8CMyqMAcmY8uhxPA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697196524; x=1697801324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2FGWNM9PQTspcwheZbOgDdwvb6kX6z9x09WP2E/g9s=;
        b=KfMH943AgHzEtUHaach2j4nYgBFKIF/aq++DxOccVHzq4lxqQW6sUwM/WPVA68yZMH
         M5y9FGDtmYDdyS/jYcGM1/hfXtC94rzeQMwyOjfZJUO8zXlp2PvC8OVeWIc3UbUhK8YX
         eYwXIeRKzty9xlF4H0KzppbxfCcpo2lEMvlWdaLle1QbfWb9Fb/geeQ4GOuBV+td8gkU
         OSYNL64Bch4GB9fAJCzvV2ZAZI0UrMtlj7h+x/hPM4dRghwQTzF/qIaZQWqgnRd7tI2H
         PcU8g+TYy0hvTLKe96uio8rX9B9i/C8jpBx2FCJpGF2HanLssYmwbc7yvgDYZ1IWBfnC
         DhjA==
X-Gm-Message-State: AOJu0YzgGZazwAV9kwIFRLvPcUOMSVrP/7qsJ/iorUGo4MHjURc0CuZt
	VpnLIFzNb1/+9G/pipD4f2I/WpdG4KLEBqsv7sPj6RYwPtU8+EZyVhMASuWPZHRL0vEkqgwiras
	RAfb4lWpNgpRh7Gp14wLcqwe7DjPP2d/+rA==
X-Received: by 2002:a5d:6daf:0:b0:32d:62e7:8ff9 with SMTP id u15-20020a5d6daf000000b0032d62e78ff9mr11028877wrs.34.1697196524410;
        Fri, 13 Oct 2023 04:28:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBOIWma0ZPvLUrWWSn31ktAlhRhvcHOgq8fMMQGbiPdhJP4qXNVBZCjog6ODEsXBz9D3TT1Q==
X-Received: by 2002:a5d:6daf:0:b0:32d:62e7:8ff9 with SMTP id u15-20020a5d6daf000000b0032d62e78ff9mr11028853wrs.34.1697196524107;
        Fri, 13 Oct 2023 04:28:44 -0700 (PDT)
Date: Fri, 13 Oct 2023 07:28:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231013072659-mutt-send-email-mst@kernel.org>
References: <DM8PR12MB54801E873241AA02CC32CDCBDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231009121638-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480E0F15A1BBDD745EE3AF4DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <25375529-9c40-9ea9-692e-f557c514c72f@intel.com>
 <PH0PR12MB54812E59B581546FFB118F3FDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f875fa3b-4b33-71c2-e612-bc2a674a1e59@intel.com>
 <PH0PR12MB548171A06CCE458C913E4961DCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <97aa9108-0715-2483-f5cf-02698c745d60@intel.com>
 <PH0PR12MB5481F4F3B4FADD79770ADEA6DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <4a8bf09e-9aa3-4aec-a20e-8c92f3da3d3c@intel.com>
MIME-Version: 1.0
In-Reply-To: <4a8bf09e-9aa3-4aec-a20e-8c92f3da3d3c@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Fri, Oct 13, 2023 at 05:06:02PM +0800, Zhu, Lingshan wrote:
> Hint: how do you define device context for every device type, e.g,
> virtio-fs.
> Don't say you only migrate virito-net or blk.

Indeed. I don't think anyone can avoid either defining that or
leaving that completely up to implementations and just hoping
they don't miss anything. Given the choice I'm definitely for
defining. Each device must grow a "migration" section documenting
the context.

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

