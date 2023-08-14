Return-Path: <virtio-comment-return-7076-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19825EB64DD
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 11:25:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6816EC8C4D
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 11:25:07 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5DF7D98640C
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 11:25:07 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4FA44986419; Mon, 14 Aug 2023 11:25:07 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3176198633E
	for <virtio-comment@lists.oasis-open.org>; Mon, 14 Aug 2023 11:25:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692012299; x=1692617099;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PV5O0TNB6QguCFodXuHXEwkmgxPBYW16BMuc6WHp5Ss=;
        b=AxAWJbT2gIPtbezoaKtOztFTvJRq4xn2sh7nZNNCPEMwzWoopGzPwjgkBzpg56ihfH
         FcdIFgzajfhXpb0IZAxHuIRJjVWvppOhs98SQ41rq0R/f6eDmG64qA4XwNZ9aXHI10Fs
         CFfMpiaAQRAWWR/LbDPkg/SeZPr2IeFNuyJS7OZQCbaZExScvRXL17KKaCgMyMSqhzAR
         jLlE2/O+BLlSm0wHHShAHUX4goJmBAIgyw4W/lCX729o92Mhduh8PwdWlCeRQlkDwde3
         cIAF7wAiIbot8TXmYcWqhi5hpUQnSEHEm+0aBZ2UzqlfYVEMZFiDVyxmddOSfQWarhyg
         Q+Vw==
X-Gm-Message-State: AOJu0YwI9pTFuj5AI+Ph0GOqq/h1ZBsqBtOESfMn1xLD+28NWbe0FMTe
	WOLmcE2nHkguXPDIroVriboanQ==
X-Google-Smtp-Source: AGHT+IGIKbMJFD/PVt1loukOTB/t9u17qJbts94NtlasyhslzmFjPu4FMI2zSRpkPXwB3ht6MP54Cw==
X-Received: by 2002:adf:f4c6:0:b0:317:5399:bb5b with SMTP id h6-20020adff4c6000000b003175399bb5bmr6485561wrp.25.1692012299241;
        Mon, 14 Aug 2023 04:24:59 -0700 (PDT)
Date: Mon, 14 Aug 2023 12:25:02 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: virtio-comment@lists.oasis-open.org, eric.auger@redhat.com,
	virtio-dev@lists.oasis-open.org,
	Zide Chen <zide.chen@intel.corp-partner.google.com>,
	crosvm-dev@chromium.org
Message-ID: <20230814112502.GA37241@myrica>
References: <20230803153238.541803-1-jean-philippe@linaro.org>
 <20230803153238.541803-5-jean-philippe@linaro.org>
 <ca33f633-26ea-b254-a75d-3bbf86d15d24@daynix.com>
 <20230810151036.GA1901900@myrica>
 <96d8b628-3f21-40de-ab2e-20e6043dc937@daynix.com>
 <20230811142039.GA2189828@myrica>
 <b7b62822-4371-4a47-bc28-25a0b0ef92c5@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7b62822-4371-4a47-bc28-25a0b0ef92c5@daynix.com>
Subject: [virtio-comment] Re: [PATCH 4/4] virtio-iommu: Clarify hot-unplug behavior

On Sat, Aug 12, 2023 at 03:25:10PM +0900, Akihiko Odaki wrote:
> > > By the way, crosvm's logic to detach endpoint on removal looks incorrect for
> > > me. A domain may have several endpoints attached, but the code looks like
> > > it's always destroying a domain whether there are other endpoints attached
> > > to the domain. I'm adding Zide Chen, who wrote the code according to git
> > > blame, and crosvm-dev@chromium.org to CC.
> > 
> > Link to this thread for more context:
> > https://lore.kernel.org/virtio-dev/20230803153238.541803-5-jean-philippe@linaro.org/
> > 
> > I thought crosvm rejected attaching multiple endpoints to one domain but I
> > think I misread. Rejecting multiple attach would be a straightforward fix
> > (it's allowed by the spec), though it would prevent assigning endpoints
> > that cannot be isolated from each others by the hardware (the driver won't
> > attach those to different domains, if it's made aware that they should be
> > in the same IOMMU group, for example if they are on a conventional PCI
> > bus).
> 
> Now we figured out an endpoint should not be detached from a domain without
> a request from the driver anyway so the code to detach an endpoint can be
> simply removed.

Yes, but I think the other detach path, when handling ATTACH or DETACH
requests, doesn't support domains with multiple endpoints attached either:

    // Currently, we only support detaching an endpoint if it is the only endpoint attached
    // to its domain.

But the ATTACH handler seems to accept attaching multiple endpoints to the
same domain?

Thanks,
Jean

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

