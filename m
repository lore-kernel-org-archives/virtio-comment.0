Return-Path: <virtio-comment-return-5946-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C520C77B7F
	for <virtio-comment@archiver.kernel.org>; Tue, 16 May 2023 20:47:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 68238FD562
	for <virtio-comment@archiver.kernel.org>; Tue, 16 May 2023 20:47:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5DC589862F8
	for <virtio-comment@archiver.kernel.org>; Tue, 16 May 2023 20:47:57 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 50F379862F6; Tue, 16 May 2023 20:47:57 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3F6759862F7
	for <virtio-comment@lists.oasis-open.org>; Tue, 16 May 2023 20:47:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: a50wcb5CNEuPaJOL_NT55A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684270073; x=1686862073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8gk4pvuepe50HPJk/BfB2umcECVMR7WSfmPRQilRy0g=;
        b=Ih/H5kGjjT+3ViLF8yveuQZcMQMZl0US9eWAakoWKGciDqjW2OQIsKoUd32f3HDU9O
         FgCoy3lGNztaqNlIabqKRGb7SyFx+vKw9KpnSJB19f5kLC/ZEubdrcf8QkGvmq/DlDIq
         nfpMdrN1Gc/Ly4npk7gqYd/u4ISl8j1ZsnQpyOPzlJd4HfGl93SB1Mot0wdsKsloFeiT
         J5mFEch8/AU4ZJOECSYVaOM2O47niI2MeamyY32x1CKVf9Qm8QYPSCKFyD/e4Mb1WuiV
         6Fc8NC+fkl+WFvouwntDdGuF5PnCpsZ/VWl5HUD7kpuIMJDnrpFujC1gzoHAD2aF7lbE
         n38g==
X-Gm-Message-State: AC+VfDyxvCEnDHaVT8/9rxzH9HBtl11Z9aQxu5OhDxWXG9w+0r2u3QLR
	CH7Y4SUaDxd8ZXGpIcvPITRdS5GoKmWJivTY4PmP7Zyw0JGL/ytLMjXRBV+Wzhr4jyonHXIasaU
	6RLVH1HnMDC249bM4xsWFrpBcReKTc3YRIg==
X-Received: by 2002:a5d:6287:0:b0:309:3573:b659 with SMTP id k7-20020a5d6287000000b003093573b659mr2157327wru.31.1684270073249;
        Tue, 16 May 2023 13:47:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ46cafMdeFj/Q7vOTo7cEAskblKntlqGqcBv3D1zxUilFlwT/T1egG/Z0o0YOtgw9a4946lUg==
X-Received: by 2002:a5d:6287:0:b0:309:3573:b659 with SMTP id k7-20020a5d6287000000b003093573b659mr2157312wru.31.1684270072949;
        Tue, 16 May 2023 13:47:52 -0700 (PDT)
Date: Tue, 16 May 2023 16:47:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230516164254-mutt-send-email-mst@kernel.org>
References: <20230516030139.767838-1-parav@nvidia.com>
 <20230516013842-mutt-send-email-mst@kernel.org>
 <87lehohefn.fsf@redhat.com>
 <20230516054313-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481451FE5B75AEA9864C0E1DC799@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481451FE5B75AEA9864C0E1DC799@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH] content: Replace guest OS with driver

On Tue, May 16, 2023 at 07:50:48PM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Tuesday, May 16, 2023 6:05 AM
> 
> > 
> > SO I propose:
> > 
> > \item[ACKNOWLEDGE (1)] Indicates that a transport driver has found the
> >     device and recognized it as a valid virtio device transport.
> > 
> > \item[DRIVER (2)] Indicates that a device type specific driver was found
> >     and will attempt to attach to the device.
> > 
> Above bisection is a implementation specific example of Linux (though valid and widely used one).
> 
> The UEFI virtio driver doesn't even have such two drivers.
> In some OS variant drivers are merged to single kernel binary.

which one?

> Does driver only matter with device_driver structure or module binary?...

Can't parse your question.

> Driver is largely the software entity that drives the device.
> I think we can keep the spec simple enough to not mix these details and just call it a "driver".

Not just linux there are lots of drivers like this.  the two bits pass
useful information the way you changed it this distinction is lots.
I agree it is worth thinking what exactly does it mean.
Since you researched it - what exactly do drivers
such as uefi and the unnamed "some OS variant" do exactly?
when do they set ACKNOWLEDGE and when DRIVER?




> > 
> > BTW somewhat related, I would maybe fix
> > device-types/mem/description.tex:change
> > not to say "device driver", just "driver" for brevity.
> > 
> Ok. will fix.


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

