Return-Path: <virtio-comment-return-5482-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CC0C77B6E
	for <virtio-comment@archiver.kernel.org>; Fri, 14 Apr 2023 06:57:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A101F2B003
	for <virtio-comment@archiver.kernel.org>; Fri, 14 Apr 2023 06:57:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7E5C8986614
	for <virtio-comment@archiver.kernel.org>; Fri, 14 Apr 2023 06:57:24 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 62326986601; Fri, 14 Apr 2023 06:57:24 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4F9F4986600
	for <virtio-comment@lists.oasis-open.org>; Fri, 14 Apr 2023 06:57:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: HougjFaWOCeeDyvwaDvxIQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681455441; x=1684047441;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FIO4F73JjJRpQcQnEl7LSbyxcLjDiN2ALWxD6WZNmv4=;
        b=i+1ToeqcdAnyOB41jIcy+I29S023FP2Z9OG9eN6e+e0IVNIpedJyqIfHPnYoXJ+pwp
         cIZxi/mU53nJdcIzlYrQlVSgOYkMW3Bd0tiBPZSCDkWvUBjc/nbQUy6ZOlTZLiqiWnix
         KG093kR52Yt8baqCFB/tLL3BVcrTK1JRYyjlsOdwa5VJA40M1GbGSZA+AQt8UNKmvi5l
         fWaomMnMzHrIuo4R075RkV4FxjteN0sx67fs/HBQk2VLOKulhv148MjSLGXs/HSHdqnh
         +TcSNZMvDSx8Wea6bTIY6WTUoS4BHprq0TcZKErq5SKTHqBBEt4xZYZyXU9dgqoLVqKb
         u3SA==
X-Gm-Message-State: AAQBX9d1ErEJgm5PF7lcFdfKp0IDujzxUvJwFgGcawOV2lMz/fBAJhmR
	tkMG2VuBIvLK72/Za6mSoiAukl6J6KGRkTUfyTfx8yZAqPeuwLb2WgtJ8Rhgx2XWzDFa38UI9yh
	0Rit5IxSu5qiYbhUCBiLUENAEttU3IpVqtw==
X-Received: by 2002:adf:e305:0:b0:2e4:c0b5:fdcb with SMTP id b5-20020adfe305000000b002e4c0b5fdcbmr3305848wrj.28.1681455441143;
        Thu, 13 Apr 2023 23:57:21 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZoYdL7vvB4oQth32PdEWdUhqmZCqTUmo/Iy8oeeSd63/lcDYVLMp5nIYj51g9lRsX+5hL4zg==
X-Received: by 2002:adf:e305:0:b0:2e4:c0b5:fdcb with SMTP id b5-20020adfe305000000b002e4c0b5fdcbmr3305838wrj.28.1681455440819;
        Thu, 13 Apr 2023 23:57:20 -0700 (PDT)
Date: Fri, 14 Apr 2023 02:57:16 -0400
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
Message-ID: <20230414025523-mutt-send-email-mst@kernel.org>
References: <CACGkMEu2B_GogDR9HUwB7mT8fkGh+Q_buPLz4nhwhK7h9k6BQQ@mail.gmail.com>
 <PH0PR12MB5481F0CF5A555A6BB2CE856CDC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuNOYOxvcSzrs0UFEyk+xOkGUpOfhK8rOy_Mebz5b5wdg@mail.gmail.com>
 <a74d3107-d38c-df15-e2ff-f848635f24bd@nvidia.com>
 <CACGkMEt+bGN7UYEopXPj0+deAnYm1VUNp05VvGHcJnkd8LzbGg@mail.gmail.com>
 <f9f01f9d-f6ec-0daa-a11d-c75589dcbe6c@nvidia.com>
 <20230413163216-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818B39801152ECBA138E73DC989@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtMKqzN3E9S-pusTr=doYRtDvTZUie2PrygzPiH0p5fvg@mail.gmail.com>
 <PH0PR12MB5481EEEE5BFE68CDC6628455DC999@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481EEEE5BFE68CDC6628455DC999@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH 09/11] transport-pci: Describe PCI
 MMR dev config registers

On Fri, Apr 14, 2023 at 02:43:21AM +0000, Parav Pandit wrote:
> 
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Thursday, April 13, 2023 10:37 PM
> 
> > I'm not sure I get this. With VIRTIO_NET_F_LEGACY_HEADER, we don't need
> > mediation for datapath. For the control path, mediation is a must for legacy and
> > it's very easy to keep it work for modern, what's wrong with that?
> 
> There is virtio PCI VF.
> The user who attaches this VF to the VM, it doesn’t know if its guest is to run legacy driver or 1.x
> Hence hypervisor doesn’t want to run special stack when guest may (likely) be 1.x and device also supports 1.x.
> 
> Therefore, MMIO BAR 0 emulation is better solution in this use case without any mediation.
> The current specification claim that transitional device "works", hence it is fine to extend BAR0 to be of MMIO type instead of IO type.
> 
> In some other cases control path or additional other mediation can be done.

Do you refer to the trick Jason proposed where BAR0 is memory but
otherwise matches legacy BAR0 exactly? Is this your preferred
solution at this point then?

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

