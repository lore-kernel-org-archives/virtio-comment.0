Return-Path: <virtio-comment-return-8754-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F863C4167B
	for <virtio-comment@archiver.kernel.org>; Wed,  6 Dec 2023 10:17:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B2F8F45B4C
	for <virtio-comment@archiver.kernel.org>; Wed,  6 Dec 2023 10:17:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 86D10986914
	for <virtio-comment@archiver.kernel.org>; Wed,  6 Dec 2023 10:17:42 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6E2969867BC; Wed,  6 Dec 2023 10:17:42 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5CE579866E7
	for <virtio-comment@lists.oasis-open.org>; Wed,  6 Dec 2023 10:17:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: WGdol6xBN_KBR-iZVDFCBg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701857851; x=1702462651;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZthwVw7KjsI8I+9PlqnZOgHm5xy7kHr5KidQMVYQcGE=;
        b=ibImTFhz14gEmhZ4IiEITqDS5L/nzA9UVSrGIYhJ3+Nejcu80Ba5wcrpBDj3osEjxJ
         ToFh4iXgVy4WM8cIHo0j8CPHiMVXFztXR2mVupZMRXh8lfN8S/c9uMJQTh7vaX5+a+Hh
         2uBVLOeF19NZrhqawcmDTCMjmKykPVn5T+cnGy8Pu7uMM+SPran2dJnbs5v6YnfgIPn0
         Geeu0NT8VsnXKPlRkoQhHAH5/Pb+dj63H2F7PLdNoJdw3wAKX0Qq9nZkyWlWlEh0zsLc
         DlRpVmaj+DluC+CKPcI09ETCZDi/tJViF4RFLUa1XjmES0epHRd1rRL4HAaat4R9qoVv
         LvNw==
X-Gm-Message-State: AOJu0YxQUdIR0G2bcSzat5PG72RIDqxWcXDR1NETDip3f5HpObTG5afB
	vzq6z5RJS8NOD1kdXlloLuaW8AJhNVtFkmyVrc/s0kl37haqbNK7+IRL1YPqpq1yu25Sj3deGQE
	ZkVLWnilJRTvyDeeNDlfddxpnOZ6sZ/zzgA==
X-Received: by 2002:a2e:86da:0:b0:2c9:f37a:c018 with SMTP id n26-20020a2e86da000000b002c9f37ac018mr347175ljj.25.1701857851056;
        Wed, 06 Dec 2023 02:17:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPl8+fLS9RfwmDYMetZQ9bkpoS0MlfW2jFfAgydrG6qT7Zx2NnrC+7cBxEh2HmfXbGBidJAg==
X-Received: by 2002:a2e:86da:0:b0:2c9:f37a:c018 with SMTP id n26-20020a2e86da000000b002c9f37ac018mr347167ljj.25.1701857850675;
        Wed, 06 Dec 2023 02:17:30 -0800 (PST)
Date: Wed, 6 Dec 2023 05:17:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: David Stevens <stevensd@chromium.org>,
	virtio-comment@lists.oasis-open.org,
	virtio-dev@lists.oasis-open.org
Message-ID: <20231206051652-mutt-send-email-mst@kernel.org>
References: <20231204094123.856214-1-stevensd@chromium.org>
 <20231204094123.856214-2-stevensd@chromium.org>
 <CACGkMEuHLs=+8_RHVa9eTXfHLqo_Ra6hSrnT9k8DAG_0yz0pvQ@mail.gmail.com>
 <CAD=HUj6bBOOCWmrbxBHKymfAr3UVUL7S57FtffHi0vEzVmewDA@mail.gmail.com>
 <CACGkMEuGY9y5Zt9UdL+4V3tntnR4EyHHCRqX_P4QtmAOL0-Pew@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEuGY9y5Zt9UdL+4V3tntnR4EyHHCRqX_P4QtmAOL0-Pew@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [PATCH v3 1/1] Define a low power mode for
 devices

On Wed, Dec 06, 2023 at 05:16:04PM +0800, Jason Wang wrote:
> On Tue, Dec 5, 2023 at 6:58 PM David Stevens <stevensd@chromium.org> wrote:
> >
> > On Tue, Dec 5, 2023 at 1:18 PM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > On Mon, Dec 4, 2023 at 5:41 PM David Stevens <stevensd@chromium.org> wrote:
> > > >
> > > > Define a low power mode for virtio devices where the devices are
> > > > expected to maintain their state. This gives drivers an option for power
> > > > management besides simply resetting their device. In the virtualization
> > > > use case, this allows the guest to be suspended even with stateful
> > > > virtio devices like gpu and fs.
> > > >
> > > > Low power mode is primarily defined at the transport layer. The only
> > > > part that depends on device-type specific details is whether a given
> > > > virtqueue is device driven or driver driven.
> > > >
> > > > This change only defines the transport-specific implementation for
> > > > Virtio over PCI.
> > >
> > > A dumb question, if this is only for PCI, can the device just
> > > implement no_soft_reset via PMC?
> >
> > This is basically No_Soft_Reset, yes. If a change similar to [1] would
> > be acceptable based only on the No_Soft_Reset bit even with no concept
> > of power management in the virtio spec, then I personally don't have
> > any problems with that.
> >
> > [1] https://lore.kernel.org/lkml/20231113055138.117392-1-stevensd@chromium.org/
> 
> So if I read the code correctly, the current Qemu advertises PM but
> without no_soft_reset.
> 
> So this patch seems to break e.g virtio-net and doesn't fix virtio-GPU.
> 
> Thanks
> 
> >
> > -David
> >

what is the breakage exactly? Maybe we need a new feature bit?

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

