Return-Path: <virtio-comment-return-6821-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A9DEB64DC
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Jul 2023 09:14:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 58BC6370E4
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Jul 2023 09:14:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4713298657D
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Jul 2023 09:14:26 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 35CFF983FEB; Tue, 11 Jul 2023 09:14:26 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2212098650B
	for <virtio-comment@lists.oasis-open.org>; Tue, 11 Jul 2023 09:14:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: G03Uf2CYOeeFSZoUhQYyRA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689066862; x=1691658862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rh/P8RAOMdRN5Bi9QbBTT3riJvp8WHqp3iyzq+p1pmg=;
        b=gF37YRpagl560hN+ZL9g2vb9VL+wmy5hG09gXO+8haghbHdC0F9dcRTO7PDjrigdSB
         tIKg3aAF1OicnZ27XaWZLRDqMjzF02JHrhqRGYETi+9MQ8NuDT5wrfGwjCOaD0q5KE4h
         bph3lwPalNBHXaLbMdatAlaBYuIxb989TuSZ2LncybAD++OLpVCAT9LL+stpA3dmM9Qk
         kPVYkOM+ypxu0+/xJ5R/QXQeU5DeBSOKQMKxxSstpCXwGNxO4GUd303yflIEmOONfLzH
         2pqW/f7soWxy7tizeQIO+2AjEyjjIhCedq27+h7M3ywvle6pvB0ho9v0a7i9FsbmagwY
         APiw==
X-Gm-Message-State: ABy/qLY1FNidElQfefAmgmavJCUAWeAcWHroSR6OADsLNzX85cDAw8FI
	2SLkmYvMOm4AlyTbCUZQXsb2OF24JkhXIcY+4Wk1VcLuog7RF5CnGdybiVuVxyx/eNxOg3ahb/C
	fuVPY22DgPF8kSPcbc4a6Di4arW3Vac/M7w==
X-Received: by 2002:a05:6512:310a:b0:4fb:7626:31a2 with SMTP id n10-20020a056512310a00b004fb762631a2mr12126562lfb.43.1689066862562;
        Tue, 11 Jul 2023 02:14:22 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEBLvliDpl1qIvyb+qgbfXPhko67+y2b+7cQp3qA5bZN/DCC2To3P1hasktvoVaFIy81MhDxA==
X-Received: by 2002:a05:6512:310a:b0:4fb:7626:31a2 with SMTP id n10-20020a056512310a00b004fb762631a2mr12126525lfb.43.1689066862174;
        Tue, 11 Jul 2023 02:14:22 -0700 (PDT)
Date: Tue, 11 Jul 2023 05:14:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, virtio-comment@lists.oasis-open.org,
	david.edmondson@oracle.com, virtio-dev@lists.oasis-open.org,
	sburla@marvell.com, jasowang@redhat.com, yishaih@nvidia.com,
	maorg@nvidia.com, shahafs@nvidia.com
Message-ID: <20230711051109-mutt-send-email-mst@kernel.org>
References: <20230710161752.204248-1-parav@nvidia.com>
 <20230710122502-mutt-send-email-mst@kernel.org>
 <87pm4ylspa.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87pm4ylspa.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v14] admin: Add group member legacy register access
 commands

On Tue, Jul 11, 2023 at 11:10:09AM +0200, Cornelia Huck wrote:
> On Mon, Jul 10 2023, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Mon, Jul 10, 2023 at 07:17:52PM +0300, Parav Pandit wrote:
> >> +The \field{flags} value of 0x1 indicates that the notification address is of
> >> +the owner device, value of 0x2 indicates that the notification address is of
> >> +the member device, the value of 0 indicates that all the entries starting from
> >
> > , the -> and value of 0x0 
> 
> Looking at this sentence again, maybe make this
> 
> "A \field{flags} value of 0x1 indicates that the notification address is
> that of the owner device, a value of 0x2 indicates that the notification
> address is that of the member device, and a value of 0 indicates..."
> 
> if you're tweaking it anyway?

Oh yes, of course. Ack to that.

> >
> >
> >> +that entry are invalid entries in \field{entries}. All other values in
> >> +\field{flags} are reserved.


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

