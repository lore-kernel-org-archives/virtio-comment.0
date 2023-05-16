Return-Path: <virtio-comment-return-5950-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94419C77B75
	for <virtio-comment@archiver.kernel.org>; Tue, 16 May 2023 21:11:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 19F8D7A8C0
	for <virtio-comment@archiver.kernel.org>; Tue, 16 May 2023 21:11:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 931F19867F7
	for <virtio-comment@archiver.kernel.org>; Tue, 16 May 2023 21:11:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 12DE3986706; Tue, 16 May 2023 21:11:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D5E6D9862FA
	for <virtio-comment@lists.oasis-open.org>; Tue, 16 May 2023 21:11:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: rkb5g8lPP2K9-x-Z8Hachg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684271502; x=1686863502;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N/iiiaceKZsE+IZsDGvi7gmkMiFVQxlV6fBOXalkqU4=;
        b=Q5zeiS/wFeVtVkGYXvZlUryoSXpcliJ9gizpRWrTrQ8AYa8ZJ5CHHRrQ8tlx8Wa/wl
         /PyAxujX7IIvqvLgH9H23Lfh2Dd+gfCsEYtVtK2Ttsz2/fB5WP8tVTVPcRd29Kr3eppG
         BA6VIcv9WEJ7MSYuO3dmg3hBNtw7l8r+3i0w1oLb+7tbpp+h3XUAeD+qi4a+SX82H4NF
         pFdpoNTgXhAulebTT0E6G8roRXkslaNwxdj0JQGxDmRxVBoE5zJnOtykxILDJRzxqZqe
         Iv/oXRBUPqrmgAye45xBA6//mNQIy4yqOPDAKRODnneF+09PWYTNRQI/JJSFrclRWRLW
         3XdQ==
X-Gm-Message-State: AC+VfDzPGNMG596n2R2ycCpgbKV5e5+v1rZCwkZ13vXG3xQFXxOcR5I+
	xBBwWcsrrab1S6rCKW8x1q9chwV15FImC6iZsV9fXhWPoVh9t6BhlMx5nvzbSiMkF4QK0dMbgPA
	6qY+2HpUSnxQ6qnnb7fhO7Hk1/JhF/kdSz8HER+eb8A==
X-Received: by 2002:a7b:ce95:0:b0:3f4:e853:6a1 with SMTP id q21-20020a7bce95000000b003f4e85306a1mr12998558wmj.38.1684271502702;
        Tue, 16 May 2023 14:11:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5+w25qRTjVzMEF3ykfThHxfG6ruu2YQQKYxTrFytJEieSaqmEfEH/peFvXO2Z7YjrwEUOJ0g==
X-Received: by 2002:a7b:ce95:0:b0:3f4:e853:6a1 with SMTP id q21-20020a7bce95000000b003f4e85306a1mr12998550wmj.38.1684271502385;
        Tue, 16 May 2023 14:11:42 -0700 (PDT)
Date: Tue, 16 May 2023 17:11:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230516170940-mutt-send-email-mst@kernel.org>
References: <CACGkMEt_2B68a+BZ4-vfeDf_eYj5ZhxrDNd6dxuiF85qr0yN2g@mail.gmail.com>
 <20230507093959-mutt-send-email-mst@kernel.org>
 <CACGkMEtfMbcu2OPsH6P2tA1aHh2FKygv=xkJ-e1XQzb62nE1vQ@mail.gmail.com>
 <20230510014534-mutt-send-email-mst@kernel.org>
 <CACGkMEvTs9oMewgrQpYZu1v1wdUXtxsvjqB6CPRf+y4C8EN_KQ@mail.gmail.com>
 <20230510033812-mutt-send-email-mst@kernel.org>
 <CACGkMEsp0i7EyyBBp06wJzrVBLNbH7MP_TT-j7b5c_yavgAmqw@mail.gmail.com>
 <PH0PR12MB5481BCA4D8F6546B3300DD29DC749@PH0PR12MB5481.namprd12.prod.outlook.com>
 <83603339-e3fa-fe56-d447-813e73eb1961@redhat.com>
 <PH0PR12MB54815633F6C88A1EFFB24500DC799@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54815633F6C88A1EFFB24500DC799@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v2 0/2] transport-pci: Introduce
 legacy registers access using AQ

On Tue, May 16, 2023 at 07:35:20PM +0000, Parav Pandit wrote:
> 
> > From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> > open.org> On Behalf Of Jason Wang
> > Sent: Monday, May 15, 2023 11:55 PM
> > > I don’t see how this is being any different than register-offset interface.
> 
> > > It bisects more things at hypervisor level that makes things hard to add #12th
> > entry.
> > >
> > >> 1) device features
> > >> 2) driver features
> > >> 3) queue address
> > >> 4) queue size
> > >> 5) queue select
> > >> 6) queue notify
> > >> 7) device status
> > >> 8) ISR status
> > >> 9) config msix
> > >> 10) queue msix
> > >> 11) device configuration space
> > >>
> > >> It focuses on the facilities instead of transport specific details like registers
> > (we
> > >> don't even need legacy registers in this case), I gives more deterministic
> > >> behavior so we don't need to care about the cross registers read/write.
> > >>
> > > 1.x has these registers at raw level and that seems fine.
> > 
> > 
> > Note that 1.x has more, the above is dumped from the section of "Legacy
> > Interfaces: A Note on PCI Device Layout".
> 
> Yeah.
> Current two commands proposal has one box to transport legacy registers that follows the legacy semantics.
> Above commands in future with legacy commands of this work will be able to work together in future anyway.

Nah, we don't need a "break randomly unless it's a full moon and you
cross your heart three times" mode. If you are going to implement
support for legacy emulation implement it in a way that either
predictably works or predictably refuses to load.

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

