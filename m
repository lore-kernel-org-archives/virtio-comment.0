Return-Path: <virtio-comment-return-8127-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AF7C4332F
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 14:01:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 16EA62AC6A
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 14:01:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F043E986C0D
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 14:01:18 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E6240986C01; Thu,  2 Nov 2023 14:01:18 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D8DC4986C02
	for <virtio-comment@lists.oasis-open.org>; Thu,  2 Nov 2023 14:01:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 8X_rxPv0MhCXnUKiuKShBw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698933674; x=1699538474;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgtokStk2iLN1Af5qU1UfFTOSsfVeHF7I5VkxKuJJl8=;
        b=p2CZkdDw1AQy5Wj+VEPTPAYd2gbVihsmhObhuXSyZEIOgiuVZMvmnbPIq+ejyLkm6/
         L3o50+uBxJ5Rw8bGE0yA4Nw9/6KI9wvNlihmYsRorXFwQejD06MvZ1AgEigttEnPgPgH
         YrvYlUMOY+jAGWVjkYx0ICbYrvtY7mn6o/KQchn1dsrzSyo4UGT4AzyjguZKhtJgRz3A
         CXLk7shffag2gtKIyBMtIqXhmBpX3czyoDrauLZOGCuHw7W34ADVlKuhIxWoZA2tPfxK
         aN+0N2YKgvng7A23NC7PtX06am60/H8B7gLktCxINX/Kdgo6St+ivJG5m4hkf8ibyo4C
         sv1Q==
X-Gm-Message-State: AOJu0YwMZ24Gu7kXIqtwzhL7C7/NqQnjlteMEC0iBoxdVD22Y7dzwcOH
	d4rtvUypV+LgJRRaMdUbpHCkC7VcIev4OUCQu6pIdI3z6XvzeiGnJk3B7dXl4nOChMSF/uarBPI
	/FinMs2MWO82RG/IN7g/qWkorEsRiszM47g==
X-Received: by 2002:a17:907:3f17:b0:9d0:6108:993a with SMTP id hq23-20020a1709073f1700b009d06108993amr4576970ejc.36.1698933673853;
        Thu, 02 Nov 2023 07:01:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgo2op6e/HSYntvDF+92iLA/NvucqOKuPk1zlaR+37tCAUUUvyyrSZjFy8CCWVlk/7MAQQpQ==
X-Received: by 2002:a17:907:3f17:b0:9d0:6108:993a with SMTP id hq23-20020a1709073f1700b009d06108993amr4576943ejc.36.1698933673471;
        Thu, 02 Nov 2023 07:01:13 -0700 (PDT)
Date: Thu, 2 Nov 2023 10:01:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231102095601-mutt-send-email-mst@kernel.org>
References: <CACGkMEvwFno6ynKzi1WPAj=fF2xmzRS_kUKfL8UJU8sTcjDHbA@mail.gmail.com>
 <PH0PR12MB548140823FA205FA06597692DCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <d3b029a0-5a50-c697-066a-e4f8e85b807c@redhat.com>
 <PH0PR12MB5481CE2BD779F1D96914FB6EDCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsC9F0SY=ydOSe+nV11L7d2t1Ypzr6nz_UoUc3w632VUQ@mail.gmail.com>
 <PH0PR12MB5481F7BE5C7F4430D1F26B06DCA0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt_HnZ26ZySCt8w58-OdH+UDzqveqZ2=LN3mK3Z3oy4EA@mail.gmail.com>
 <DM8PR12MB548082010AC006539B04CB16DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEuh+9h9nwGbv63onEh2MgGoCEkKmCwsLEvJ9O5NqtFs-Q@mail.gmail.com>
 <PH0PR12MB548181EA329E774DC359FD10DCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548181EA329E774DC359FD10DCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Thu, Nov 02, 2023 at 06:10:25AM +0000, Parav Pandit wrote:
> > > > > When a use case arise, device context can be expanded.

So I just suggest you scan the comments for suggestions and
just add them all. Will be much faster than all these mega
threads. One of the reasons this discussion keeps getting
stuck is that whatever is not in your proposal you immediately
start asking for proof it's actually needed or dismissing
as not necessary. Spec design is fundamentally a speculative
edeavor we are trying to predict what will make a good
implementation. So what we do it think up theoretical
use-cases, and try to see design can address them, and if
it can then hopefully the completely unexpected that will
actually be needed in real life will be possible.

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

