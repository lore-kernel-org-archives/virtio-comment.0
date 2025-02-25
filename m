Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2113526A1C1
	for <virtio-comment@lists.linux.dev>; Tue, 25 Feb 2025 15:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740495893; cv=none; b=QmFB7/0120MWvX+I7F9oNcK7/876wS2yBqrHYbEUNllVMpc3Gqf2LaUGtqGyesPZAvpYfddkDmbh/Yd7e6gNJLzx1hUXqO1zaN1oIpxLNKSzn7RZ0aDkO9IatDiiDN7V/12RbURZh7exm01vOSlm9bFphdqo/fjNSuinIII29pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740495893; c=relaxed/simple;
	bh=vGWoUXYv2SX/GZHV4YjD0o8bXG/oklUf+W+O/7HnLAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=f4Bb7SWc04xqWRBcKoOoqlTeCWaqktbOQy0s7sRfaptu9jw6gu3fVMgTbyb+PY0xp9wku20Bz8DyS/ZE6wGGzNatDDSqsE0Vyz5z+q/lnmuUUYkHjTZ24Cgnu+MD9dqhCtl54JzGZ7rA0WhgLaQlep1GoHGf/ecBzy6Caxd+8yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c6BT20jz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c6BT20jz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740495891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bRSwrZTUBjy55JNBwkIlNDFIpHB3T+uOrOF7Yw0zaiY=;
	b=c6BT20jzysepYGVboITqw9bGNmweBstexJttTQcS2l4w51OQug1ao79YVaqC3M64uazbp0
	crf6wGEnK1g5vMHcoIFK3wl50pIi0Lzr2g0hA5a9mQPxmtClszAKbNNB4ZzQYTTnu0Dbbo
	8QI8XRF2bvS3dhOOezvyRFEGz/KaRFE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-fSWoKzFCMkWzxocAyKoaug-1; Tue, 25 Feb 2025 10:04:49 -0500
X-MC-Unique: fSWoKzFCMkWzxocAyKoaug-1
X-Mimecast-MFC-AGG-ID: fSWoKzFCMkWzxocAyKoaug_1740495888
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43947a0919aso54287095e9.0
        for <virtio-comment@lists.linux.dev>; Tue, 25 Feb 2025 07:04:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740495888; x=1741100688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRSwrZTUBjy55JNBwkIlNDFIpHB3T+uOrOF7Yw0zaiY=;
        b=hSsxTO1oMuHCIVnryo2cuTHEonEuiks7ztxEPKhJmjTpxvSGRkwpInW/jmL+a69l69
         Q9HKHe99fZiUyzU46F5TWvlJnr5PQj3B13i4KV7qdPRcfOECG3fL3gA4nk9UWcA8mgDD
         pzVMY+Stor9DO4kKuWfhIHfmJljD8PKSJzNzx78EWpfOA5o5u6ZXomxYPKNcbUF7fmex
         pCgYftEF86q9xIsGcd4OFgvZn+PuWoTCsTVp4In5Tr+UxztmUAxrRGLoJ1I98hXx91z9
         tQxQmCfHfmLwUob+dQu9c0XxrjIzs7sRHfEBwRJgh/u6JMEzZV/x6t5+IAUDOzIMb//Y
         P/Mw==
X-Gm-Message-State: AOJu0YzUD+IjtBeqe4K9pkd6S+jjqO/31ybMIMYVTrZmbtgejVkq2DnV
	0PG3YyBPpvkLcO2sL/xkdGc4oxQc2UITSXKy389r7dLHIjTOxkeVxcFE1omCwdDRMgWDmzDGWY4
	0dFEYMAiAzk9smWtI/mgHiEQH2CmyoYBrUJ7yornO9BCfDZOJ3AJFZjUeMrYcl7Nq
X-Gm-Gg: ASbGncsn3IjdNQ/fTGuKuIWvmF+RLrTpsbIEaKksVHYR7R3zLJgaE85aSVM35/Pqqh/
	4Uez5ZDIj7w/RW4k+YZDUkwvA9cFMUWz3qo8pSR9xwBExfUPg0qICPH5zsxvgRnrdEvhZxpiEUX
	jK7CXcguxOeCFzlf2ymWoeoF0zZ9viQOJ9Bx7iXXQFAj5OyGSC5C2e5OYLVSexPJQRpgqHBEU/s
	kr+KKW1dZ+rw5xtlLekzcXlFwtpmxcNccLNpMYomInXO2rigaWfNq6dKf7+P5y72GYeyw3dKrLX
	fhXAW8tsCA==
X-Received: by 2002:a05:600c:5492:b0:439:9f97:7d5b with SMTP id 5b1f17b1804b1-43ab0f6481fmr36897295e9.23.1740495887663;
        Tue, 25 Feb 2025 07:04:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdc29LkPzhNTKnFh1EHRrAsHtY7Hit4OVBSXYsEONnRBDgrJtEs6Nls9H5g375G8byQflyAw==
X-Received: by 2002:a05:600c:5492:b0:439:9f97:7d5b with SMTP id 5b1f17b1804b1-43ab0f6481fmr36896485e9.23.1740495887013;
        Tue, 25 Feb 2025 07:04:47 -0800 (PST)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ab14caa5esm31093015e9.0.2025.02.25.07.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 07:04:46 -0800 (PST)
Date: Tue, 25 Feb 2025 16:04:44 +0100
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
Message-ID: <Z73cDJ8i2jDHiU09@fedora>
References: <20250123101616.664-1-quic_philber@quicinc.com>
 <20250123101616.664-5-quic_philber@quicinc.com>
 <Z6tDpi07Pyk+Xjzi@fedora>
 <cyjnfnuijj57k32t2naprt65jsvm4bxc3ehkpdmempp2kgkg5i@kkere6bvir6d>
 <Z7X6bpwsqRymDHZu@fedora>
 <4g74di7srjp45qxc4qwjo6phvbxixmpmwxhu35ujchuyqshjoz@j75ttnxcqtry>
 <Z7xieowGXaZ3kqBc@fedora>
 <4wre24mz2dkf3xlokwrhrtyekgaprezwhkubsqts6ywicz74kh@5imrnci63tuc>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <4wre24mz2dkf3xlokwrhrtyekgaprezwhkubsqts6ywicz74kh@5imrnci63tuc>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OQZ6LSZ5vwBcTa41Bfq5xDLoPBXlGnuVCz6Ef1tISpg_1740495888
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 25, 2025 at 12:18:51PM +0100, Peter Hilber wrote:
> On Mon, Feb 24, 2025 at 01:13:46PM +0100, Matias Ezequiel Vara Larsen wrote:
> > On Thu, Feb 20, 2025 at 06:06:38PM +0100, Peter Hilber wrote:
> > > On Wed, Feb 19, 2025 at 04:36:14PM +0100, Matias Ezequiel Vara Larsen wrote:
> > > > On Thu, Feb 13, 2025 at 07:14:30PM +0100, Peter Hilber wrote:
> > > > > On Tue, Feb 11, 2025 at 01:33:42PM +0100, Matias Ezequiel Vara Larsen wrote:
> > > > > > On Thu, Jan 23, 2025 at 11:16:15AM +0100, Peter Hilber wrote:
> > > > > > > Add the normative statements for the alarm feature added previously.
> > > > > > > 
> > > > > > > Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
> > > > > > > ---
> > > > > > > 
> > > > > > > Notes:
> > > > > > >     v7:
> > > > > > >     
> > > > > > >     - Remove inadvertent v6 changes, which should have been part of
> > > > > > >       preceding patches.
> > > > > > >     
> > > > > > >     v4:
> > > > > > >     
> > > > > > >     - Update normative statements to match v4 changes to non-normative
> > > > > > >       statements (patch 3).
> > > > > > >     
> > > > > > >     - Driver should read clock to confirm that alarm has expired.
> > > > > > >     
> > > > > > >     - Formatting and wording improvements.
> > > > > > > 
> > > > > > >  device-types/rtc/description.tex        | 157 ++++++++++++++++++++++++
> > > > > > >  device-types/rtc/device-conformance.tex |   4 +
> > > > > > >  device-types/rtc/driver-conformance.tex |   2 +
> > > > > > >  3 files changed, 163 insertions(+)
> > > > > > > 
> > > 
> > > [...]
> > > 
> > > > > > > +
> > > > > > > +If a clock C steps to a time previous to C's alarm time, the device MUST
> > > > > > > +stop serving any previous alarm expiration event for C, within a grace
> > > > > > > +period.
> > > > > > > +
> > > > > > > +If an alarm expiration event happens for clock C, the device MUST stop
> > > > > > > +serving any previous alarm expiration event for C, within a grace
> > > > > > > +period.
> > > > > > > +
> > > > > > > +If the device is currently serving an alarm expiration event E, the
> > > > > > > +device MUST send a single VIRTIO_RTC_NOTIF_ALARM notification for E, as
> > > > > > > +soon as an alarmq buffer is available for this purpose.
> > > > > > > +
> > > > > > > +While the device is serving an alarm expiration event, the device MAY
> > > > > > > +execute implementation-specific alarm actions.
> > > > > > > +
> > 
> > Does not `serving` mean also that the device execute
> > implementation-specific alarm actions?
> 
> As for `serving an alarm expiration event`, I intended this to be a
> speaking name for a state to which different requirements can refer.
> Maybe this was bad naming.
> 

I just though that `serving an alarm expiration event` could include
executing implementation-specific alarm actions so that we do not need
to make a separation of the two concepts. I do not have a strong opinion
so we can keep it as it is. 

> > Besides notifying the guest when
> > an alarm has expired, is not any other action or device behavior
> > implementation-specific and then not constrained by the spec?
> 
> So this would imply that the below MUST NOT requirement should not be
> adopted? I chose to refer to implementation-specific alarm actions so
> that 
> 
> 1) it is clear to any spec reader that alarms may work even when an
>    alarmq notification would not work and
> 
> 2) an implementation's documentation can usually refer to the spec as to
>    when the implementation-specific alarm actions may be executed.
> 
> I find the references helpful, but I do not have a strong opinion about
> keeping them in the normative or non-normative parts.
> 

I do not have a strong opinion either so we can keep it as it is.

Thanks, Matias.

