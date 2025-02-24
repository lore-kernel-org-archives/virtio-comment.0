Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58972571A7
	for <virtio-comment@lists.linux.dev>; Mon, 24 Feb 2025 12:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740399237; cv=none; b=dXQdU1QeWiyeJtjB2belcO4kLmp5VwwECn8vSdYnibDL5zVkyUkZTBcXrh+v7CiZ44AIMfEM2q1jUES3ppFbJcV7xVaWUHeYRqzaa+HpnjwANgjVL50CAcxLn6EHRiChD0NizPvmInUUWy2na1DqYXH08warHjmJ3OgTVvEUjsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740399237; c=relaxed/simple;
	bh=13Q51cQ9ZCcjGqicfnIuJ9XUearyBLZV3kaSuecnsHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=aQGF+4SA4WdxYbMi4xtywYbMkBtgLzpZjJqSkJUfYrZbW+31Qzp3WYVwtaKAx5m+e4alKusHiIJJqsvp7BHmpJMsYJNv1cOAJ87sQUqMta7dpXRkv8dGNjazdtp6KZbreUujBmdpDvkcsZkzKcAIVk2saFUqDwdYB92RnHByfZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UUNdzfNe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UUNdzfNe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740399234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fTMHhHAtrvMbetvUA+4uXTCltJNA0plzeumYVpOtLwA=;
	b=UUNdzfNelrvo4RcqsjmSQrWLlm+PqDBl/fKyqGj2vlBwXkUgBuMAMunardpGJbgEuH4V5+
	YS1DI5kyG/R7EVlw1P2iJiCHvbELkoSkDCE0r6tkF+IdWdqeFp0eggim9G3It6GuBK0t/z
	p28MIPN3dS6wuOcbo2Y7iIUZATRknV8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-MSXfPsHyMg-HhzNz_g1Aig-1; Mon, 24 Feb 2025 07:13:51 -0500
X-MC-Unique: MSXfPsHyMg-HhzNz_g1Aig-1
X-Mimecast-MFC-AGG-ID: MSXfPsHyMg-HhzNz_g1Aig_1740399230
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38f42f21f54so1653620f8f.1
        for <virtio-comment@lists.linux.dev>; Mon, 24 Feb 2025 04:13:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740399230; x=1741004030;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fTMHhHAtrvMbetvUA+4uXTCltJNA0plzeumYVpOtLwA=;
        b=FKVBoKzmUwNQZpzdef2vDMjqY9EnxAj+fn82VinE1JWddApJW89eePYZgiElogM8P7
         7JL8x3WOiGiav/gJUGa4vzTAVSt7ISMpy8A0gCQW43HMFqyFCjeS5seloBf+0oiNfzO4
         ZlyTCCxxP9ElWJeTwvy70XTjwBEuEqtxQ2dSE2FEun7TpVzh/ZPHMjclpgSDqZypi8nK
         Q2ryzkBrqadzj2Wpnd2vt8CInbHpBRt9jG0XlfatULc5D0Y8RbFP4hXDrR8ShikBDTGu
         Kb7CyXqRV0AQWO0bSuB5FLb+osZAJOloxVufJYgE/hz7DG9i3boGpsFmWBeiSNBq+5+S
         i2ng==
X-Gm-Message-State: AOJu0YzgakAktxQUiSwcE77fAY65q4sldQrJOoiOPNzs/+Xd53Z58tJf
	WnTIx8UmRx2Sf3lAYjMR3EHRRjLm/myT9J4hTDw1yw80ah31bdrradee4nwjQCkh5zQ+sp9pl0C
	1JPyy5aC4Mm2yVf4RYjhe8QpUMm+aUNp05UDI2ufpzNEO0fTcCxikpDPX5ICKF4ie
X-Gm-Gg: ASbGncuKdunef8kHpJAOvd/qGbSfpuylsLjOfpKuB7501R8XT+ivZlkkc8giYt1S25/
	rwfJvKOcP4sUO5WdDLrnHWTDoYBKVSj5EvVEg096pF7UTJPHzY+ESehmiTsV/1iXLFqF253Ktil
	JduvCQ6TfLDeEUpkXVGhap+MdIa6riUoyk/gWAh4LkdtXhfrEQrIZ4HEIpumbw7n989pQczZ0SI
	Q95mf/FZcdbkMzQbY86G1rF5oRc6L8YgBAc13nsjj+cnm8yTShck8oKaPog9+xeDXtVOpm1XFOK
	KN294X8=
X-Received: by 2002:a05:6000:144d:b0:38f:3073:708 with SMTP id ffacd0b85a97d-38f70773556mr10918224f8f.3.1740399230223;
        Mon, 24 Feb 2025 04:13:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFjuztVRXKCJ070PnBdirENFG748ukAxFTCTRLuG5f3rdy6PdR4YYik7ujjyaHZ5kRrHeWFw==
X-Received: by 2002:a05:6000:144d:b0:38f:3073:708 with SMTP id ffacd0b85a97d-38f70773556mr10918190f8f.3.1740399229818;
        Mon, 24 Feb 2025 04:13:49 -0800 (PST)
Received: from fedora ([37.174.243.84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b030bdb4sm105666895e9.27.2025.02.24.04.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 04:13:49 -0800 (PST)
Date: Mon, 24 Feb 2025 13:13:46 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Peter Hilber <quic_philber@quicinc.com>
Cc: virtio-comment@lists.linux.dev, Cornelia Huck <cohuck@redhat.com>,
	Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"Ridoux, Julien" <ridouxj@amazon.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
Subject: Re: [PATCH v7 4/4] virtio-rtc: Add normative statements for alarm
 feature
Message-ID: <Z7xieowGXaZ3kqBc@fedora>
References: <20250123101616.664-1-quic_philber@quicinc.com>
 <20250123101616.664-5-quic_philber@quicinc.com>
 <Z6tDpi07Pyk+Xjzi@fedora>
 <cyjnfnuijj57k32t2naprt65jsvm4bxc3ehkpdmempp2kgkg5i@kkere6bvir6d>
 <Z7X6bpwsqRymDHZu@fedora>
 <4g74di7srjp45qxc4qwjo6phvbxixmpmwxhu35ujchuyqshjoz@j75ttnxcqtry>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <4g74di7srjp45qxc4qwjo6phvbxixmpmwxhu35ujchuyqshjoz@j75ttnxcqtry>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Q9sWqWiWHJgyrWRr75llvNs9XBamG5Lt1CkGh7WkSQg_1740399230
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 20, 2025 at 06:06:38PM +0100, Peter Hilber wrote:
> On Wed, Feb 19, 2025 at 04:36:14PM +0100, Matias Ezequiel Vara Larsen wrote:
> > On Thu, Feb 13, 2025 at 07:14:30PM +0100, Peter Hilber wrote:
> > > On Tue, Feb 11, 2025 at 01:33:42PM +0100, Matias Ezequiel Vara Larsen wrote:
> > > > On Thu, Jan 23, 2025 at 11:16:15AM +0100, Peter Hilber wrote:
> > > > > Add the normative statements for the alarm feature added previously.
> > > > > 
> > > > > Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
> > > > > ---
> > > > > 
> > > > > Notes:
> > > > >     v7:
> > > > >     
> > > > >     - Remove inadvertent v6 changes, which should have been part of
> > > > >       preceding patches.
> > > > >     
> > > > >     v4:
> > > > >     
> > > > >     - Update normative statements to match v4 changes to non-normative
> > > > >       statements (patch 3).
> > > > >     
> > > > >     - Driver should read clock to confirm that alarm has expired.
> > > > >     
> > > > >     - Formatting and wording improvements.
> > > > > 
> > > > >  device-types/rtc/description.tex        | 157 ++++++++++++++++++++++++
> > > > >  device-types/rtc/device-conformance.tex |   4 +
> > > > >  device-types/rtc/driver-conformance.tex |   2 +
> > > > >  3 files changed, 163 insertions(+)
> > > > > 
> 
> [...]
> 
> > > > > +
> > > > > +If a clock C steps to a time previous to C's alarm time, the device MUST
> > > > > +stop serving any previous alarm expiration event for C, within a grace
> > > > > +period.
> > > > > +
> > > > > +If an alarm expiration event happens for clock C, the device MUST stop
> > > > > +serving any previous alarm expiration event for C, within a grace
> > > > > +period.
> > > > > +
> > > > > +If the device is currently serving an alarm expiration event E, the
> > > > > +device MUST send a single VIRTIO_RTC_NOTIF_ALARM notification for E, as
> > > > > +soon as an alarmq buffer is available for this purpose.
> > > > > +
> > > > > +While the device is serving an alarm expiration event, the device MAY
> > > > > +execute implementation-specific alarm actions.
> > > > > +

Does not `serving` mean also that the device execute
implementation-specific alarm actions? Besides notifying the guest when
an alarm has expired, is not any other action or device behavior
implementation-specific and then not constrained by the spec?

> > > > > +The device MAY ignore the device status when executing
> > > > > +implementation-specific alarm actions.
> > > > > +
> > > > > +The device MAY ignore whether VIRTIO_RTC_F_ALARM was negotiated when
> > > > > +executing implementation-specific alarm actions.
> > > 
> > 
> > I wonder if these last three requirements are needed or we can just drop
> > them.
> > 
> > Matias
> > 
> 
> The intent of these requirements is to clarify that this is legitimate
> and expected behavior of the device. I can drop them if this is
> considered unnecessary as normative requirements. Or maybe one
> requirement would be enough:
> 
> 	While the device is not serving an alarm expiration event, the
> 	device MUST NOT execute implementation-specific alarm actions.

