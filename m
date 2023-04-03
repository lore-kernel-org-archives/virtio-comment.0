Return-Path: <virtio-comment-return-5177-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22892C761AF
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 20:04:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9963841A2D
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 20:04:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D31AF9867BA
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 20:04:19 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DADD39863F0; Mon,  3 Apr 2023 20:04:18 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D9CA49863E6
	for <virtio-comment@lists.oasis-open.org>; Mon,  3 Apr 2023 20:02:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: QJSVuAAQNre2IbHSHDyI7w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680552166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62TyVBhAZtEAEIhi/uD8oEUdD4eh+DskgPJR/z/GnuQ=;
        b=0j0mQZEF7HIs2TjpES+gHfw3/7uCNZZ1RHA/Ekr9wFRiFtAyBk3sMRfDQi8UB+SMoT
         AArJaw1BCLd1EX80++moj0Q/ORs2ZoJvlonnjV1NAQQ1OJtnTkAyaqoOfEICHTEd6b+I
         O5a5G0vUbzHCxJCABAKZ4P3lpi+pektgbMSzHgZApTEcqprIZuql8zULyjMJPYhPVJg0
         1Kg4QLrtKRuRRi/y5gzs9tQragWXdG9Mkmwp2XaGE4Z5V1puNYM6G0p8ZqozPLl+C9Qv
         Ivd3TBOu43n1dDNpbQLIqv7YoulkPR85eO3FkrjgkWb6DxedaMS+uycwAAMWxFZD4v1r
         NLpQ==
X-Gm-Message-State: AAQBX9cBD7N/oMSmcOJSD+F8VVSwlSzRzIS3I6tBSim0KmardE0N+YuU
	5cLEW8FPkGSbELgkYtzGV2LZ1BlK1RwBGBkChVERz+QYZ55WCWqb2ZsyO2GSPjxFgKxNwEOEK1h
	ydQPaiuKay3jBPIwGvV+o5AxoEAvqkZNBvg==
X-Received: by 2002:a05:6402:31e1:b0:4fb:5291:13bb with SMTP id dy1-20020a05640231e100b004fb529113bbmr315911edb.39.1680552165861;
        Mon, 03 Apr 2023 13:02:45 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z5IdT/oVyozjbSXcpVzBy7KhRKJUoEUPAnTpKtWk3O/850ABI9erW9uJmY9RS7gbsw3R+fUA==
X-Received: by 2002:a05:6402:31e1:b0:4fb:5291:13bb with SMTP id dy1-20020a05640231e100b004fb529113bbmr315886edb.39.1680552165537;
        Mon, 03 Apr 2023 13:02:45 -0700 (PDT)
Date: Mon, 3 Apr 2023 16:02:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230403155310-mutt-send-email-mst@kernel.org>
References: <20230330225834.506969-1-parav@nvidia.com>
 <20230403144523.GC302168@fedora>
 <46a0db06-f922-2a8a-acf0-cf7e453a2945@nvidia.com>
 <20230403134407-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54811F46C61C499621DB5563DC929@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54811F46C61C499621DB5563DC929@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH 00/11] Introduce transitional mmr pci
 device

On Mon, Apr 03, 2023 at 07:48:56PM +0000, Parav Pandit wrote:
> > OK but supporting them with a passthrough driver such as vfio does not seem
> > that important.
> Not sure on what basis you assert it.
> I clarified in the cover letter that these are the user level requirements to support transitional and non-transitional devices both via single vfio subsystem.

And what is so wrong with vdpa?  Really I don't see how the virtio spec
needs to accomodate specific partitioning between linux modules, be it
vdpa or vfio. Way beyond the scope of the driver.

But anyway, my main
point is about DMA. On the one hand you are asking for a VQ based
management interface because it saves money. On the other you are
saying DMA operations take extremely long to the point where they are
unusable in the boot sequence.
So what is it? Was admin vq a mistake and we should do memory mapped?
I know Jason really wanted that, and it makes a bunch of things
easier. Or is legacy emulation doable over a vq and latency is not
a concern, and the real reason is because it makes you push out
a host driver with a bit less effort?

I just do not see how these claims do not contradict each other.

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

