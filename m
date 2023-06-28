Return-Path: <virtio-comment-return-6583-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3F2EB64DA
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Jun 2023 17:24:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1A70E3437
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Jun 2023 17:23:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E5E3D9865CF
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Jun 2023 17:23:58 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D6F33986587; Wed, 28 Jun 2023 17:23:58 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C04DA986585
	for <virtio-comment@lists.oasis-open.org>; Wed, 28 Jun 2023 17:23:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: FQK8C0eFOZiqKx6Mpeml1Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687973034; x=1690565034;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UEhI+y/sFJpwvPUHKOKNN4EUNW3O7wtsVdNzBIXm7Nk=;
        b=ii8uoKYS750C4rCXW0PKqjpvROlFC6q/ePYu5T4rPusDyewkF3hDlhU+j1o6XzzddB
         Q7SzCSmjOC0b9VB/IZvnQcKPExLgMHge5wCtUYBbMsefdZ0dzjGKDcJyz20proxEbGli
         Wyg3T2n73LCPTyUD8Y9RWB43RiG5DbAr0PJNmlgGfOdEJ0E46/ZUS2csj9E8YH5nHRe+
         4yy8kdMDv4FNNHs7qpJUtouvM3wlmoag0gOHLRK3hyx3KblFQAeTyMBI7iLhXqIe9vl8
         1UObVLAtp4y9RTcGxzGoXPJSaa8vg51Syu5wevav9s1BD8uEgNsupA6hb4d1bQxfcRWT
         sNZQ==
X-Gm-Message-State: AC+VfDwgi06aIORr36tUnwGf1t3eaZKIoVUdordq0IhzCTkYYZd7AQtp
	As4s71Mus1OvdAEz93g+xHsm1h3b805zdrlCo0fg72lQvKOAbK60gQqeKr8zzalDJz5i6xmrLwK
	NjleHRM/BXZN+SzqedUT72/2Kc/56Q9lY9w==
X-Received: by 2002:a5d:480e:0:b0:313:e8f9:803 with SMTP id l14-20020a5d480e000000b00313e8f90803mr10421136wrq.3.1687973034586;
        Wed, 28 Jun 2023 10:23:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5irfaTSU9d07pC2xOiNetMGjhyeE25d5BHy3QPT9mMXOgkOvN5Qezr3VSFZ7w5nxI5atZbyA==
X-Received: by 2002:a5d:480e:0:b0:313:e8f9:803 with SMTP id l14-20020a5d480e000000b00313e8f90803mr10421126wrq.3.1687973034308;
        Wed, 28 Jun 2023 10:23:54 -0700 (PDT)
Date: Wed, 28 Jun 2023 13:23:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>, Heng Qi <hengqi@linux.alibaba.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-ID: <20230628132122-mutt-send-email-mst@kernel.org>
References: <20230627163549.40028-1-hengqi@linux.alibaba.com>
 <CACGkMEvFmAiWDp8w=ytin21Oi+PcTb1X3Eve7Kt2NVr_RkhgmA@mail.gmail.com>
 <PH0PR12MB54811123CFCDEFE3B48D4381DC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230628061257-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481ED6C94DE8CC414C3369BDC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230628123131-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481BA1CDA0942170186CB59DC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481BA1CDA0942170186CB59DC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] RE: [PATCH v19] virtio-net: support inner
 header hash

On Wed, Jun 28, 2023 at 05:06:40PM +0000, Parav Pandit wrote:
> > > >
> > > > Please let people just focus on fixing config space instead of
> > > > temporary cvq hacks.
> > >
> > > The ask is to have predictable sizing for existing defined config space field and
> > not keep infinitely growing by two interfaces.
> > 
> > I don't know what "predictable sizing" is or why does it matter.
> > 
> Because when device has two ways to access config space, it always have to account and build the interface that, hey some driver will not use DMA.
> Hence have it always in the MMIO accessible area.

Maybe I get it. You want to use the new features as a carrot to force
drivers to implement DMA? You suspect they will ignore the spec
requirement just because things seem to work?

There's some logic here, for sure. you just might be right.

However, surely we can discuss this small tweak in 1.4 timeframe?

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

