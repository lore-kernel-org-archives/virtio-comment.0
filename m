Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792684947;
	b=r6/YeXVD7iBu8bZsq7kSYUcXWWA24eWPbYwA0MtFOsgfONCBPvDq8JG0vWafLkf3JfBF
	 x9OXXcmUFQZJAUf3gKyqUmAslh2z6jL99wdOKWihG31rrXkLuX10h4C9mUcFOM8seUUTp
	 UFSosW+uglbyVTRor4oQcNGqSnmRPsy7yl3PiiqNkZKgrhrhzSYZk/yZ1wwC8BqfkEmuu
	 W6m44Pwxptw780Bwy5ZmpU11WH8y8bBeJl+6dMLg69V35vEkHbRvSf2OWKQTlNwLPamC/
	 BfbufeYbHNPHXQ8krZAHlNgnMurcDZuWdY7lf4uTi3/nIJY8yP1+PLkAZqUtzR9ZQYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792684947;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Disposition;
	bh=FpNrUz9PLExNURAugYvdzwvzbZtZVV4CJc+MRW6holQ=;
	b=IBCfAiyz3M9K5FWVwrpDXNwV+yWnsJ1qA2bWhnmwTiQQngkgKK9kk0JE+PrvMkJRod0m
	 t+iUlrrnj8YjN3sG5lSy0PtwOEnLUn5cvjf4ygZmZCvh1DAImfcnFikM3OESOK9MOfXx+
	 +Tgz9XAFvHsQttcYsXlCbPyvVzj9g45Cpt2PIcfSLVHd2F3Hr3OotDVShHBClFXWwLRY9
	 ASDFh+DmVm3Ft6sPFyrbOhDmCSCG8ODkanPzSWqXuJpusd3lTTA2w7+tEe/duCqFZ7YVc
	 um126Bpmo3K2bs7aVlrsLOkanEhf8dkDBNIHdCSUWiL8EwtplnzOCt0iY49eVAMOcWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hsbfIbSs;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDA7606A319
	for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 16:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EDA7606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hsbfIbSs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792684945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FpNrUz9PLExNURAugYvdzwvzbZtZVV4CJc+MRW6holQ=;
	b=hsbfIbSskKyhEHivx6dD+6lToY4ZIEw18nEPi7Gw6G6lTlRRB3cuZ92af/Y3bD5Vbieo3m
	SGfDzwSasnnRW0JlOV2QLjcoAw24wgt9nGMwC03345wE2IYaUbjV8uw/C/reaRJjU5KeJh
	lw0nviUP2RR2X9xBDrEXyIzXojSMTQg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-noo-_ivlMTGZGkDziTQ7jA-1; Thu, 22 Oct 2026 12:02:23 -0400
X-MC-Unique: noo-_ivlMTGZGkDziTQ7jA-1
X-Mimecast-MFC-AGG-ID: noo-_ivlMTGZGkDziTQ7jA_1792684942
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a20e41008cso1843295e9.1
        for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 09:02:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792684942; x=1793289742;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FpNrUz9PLExNURAugYvdzwvzbZtZVV4CJc+MRW6holQ=;
        b=ANn8tOzbWgd2R4cIOrQ9C7wAWzq3zySIkfNs10jD+J8jnSBZZwcJUEHX2N0E78xoUx
         H4E/or0AuL7wfB2cKt6Fnrq31ryasnyb0nUv9ejN0sg3lWhX67ropyc7QUpLiMXhJSYa
         jNjdQBjTGIp3w3h9OG5hGekC1PUN+byciNURYQDGPZMWOss2+GBLxJqFcOa0epPWIWt5
         IT5AQYksSU8Qk8chOom0/3UxeSYRbW45PuEqhFRGe/24gUR6sVNubpPUEOork4S0Ta0P
         N9E4c73M5R7dcBiPMovfmvRB3wASgZAXF63AR/jgDwspJ/nE2WwrpNy9OHZIVzZxpv+N
         eUIg==
X-Forwarded-Encrypted: i=1; AKwUvBxkIODx1qUf2/GggT7EsYmorz7nHjKkwTUCrS86cf9U8ADTrIm1zw/sU7bpwJEiOegpHcaV2JtRRDFaHJwdxg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJDmIaLPaordVaE2x4xAKkBkKFkLrynVGgmGmP2149f4MApL+Cy
	FNVvDK2qsG+fAYYQE4Ihu/P51h/YQR7cLDJUM/Oc0OEn51YWXBvY+pjT/p2S6+fRLL+DSj0qk1o
	t+lPBhnDaLzt9lLLNpvfEK7w6LP9ZVnDXTvLfk8Zj1W4sRZRMusw62kTpOBS014ZgyES8
X-Gm-Gg: AYBFou0HmWj2qS0kNB1sgXDK82I0/udp/vmBHz2246+yuMfC+Fyf9jtB+2yJX7/MgI0
	pxTNs3hfJuNREiofJI5YUH4f2s1C91vbV/IYPWlPXPyqaZFNPfq1btBba4UZ41r5aRWG+C00ipj
	nJEYU8NaN42UmnQNBeIPSz9h2Yao0Wkg77aqIh2ol7mjNglUCXnii+BW6GoxmLXDo0MWcBPxnYi
	tB0ajQnjyqWxs0kxhrX9zYgtYZxapDGpnY4I6fWVZAWVykFi4cmwiNE5ZmIsTMktNwC4YAZ+hSu
	iLNu4X1gNOnZxXUDYR9w75ed6HxjWn5PdmnOvquNrgy0QorE8px03HNnNaDrR6JS9Mc=
X-Received: by 2002:a05:600c:1c09:b0:4a1:f377:5c6d with SMTP id 5b1f17b1804b1-4a1fdd2485dmr116515615e9.6.1792684942207;
        Thu, 22 Oct 2026 09:02:22 -0700 (PDT)
X-Received: by 2002:a05:600c:1c09:b0:4a1:f377:5c6d with SMTP id 5b1f17b1804b1-4a1fdd2485dmr116514905e9.6.1792684941485;
        Thu, 22 Oct 2026 09:02:21 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a210330655sm5810075e9.15.2026.10.22.09.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:02:20 -0700 (PDT)
Date: Thu, 22 Oct 2026 12:02:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Demi Marie Obenour <demiobenour@gmail.com>,
	Peter Hilber <peter.hilber@oss.qualcomm.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Trilok Soni <trilok.soni@oss.qualcomm.com>
Subject: Re: [PATCH v2] content: Reserve ID 52 for QPSFI device
Message-ID: <20261022115837-mutt-send-email-mst@kernel.org>
References: <87mrs62vzj.fsf@redhat.com>
 <26e6efbe-abc0-452d-a682-611cf91e41b8@gmail.com>
 <20261022032118-mutt-send-email-mst@kernel.org>
 <CAAjaMXZgKGWL0dJJSh74Pf20EezY8zPOsSg1aNkp_ssvXuP7BQ@mail.gmail.com>
 <20261022091645-mutt-send-email-mst@kernel.org>
 <oinsf3ecwsrgxuff2m4q3qsjzfg3quldsqv3wjnlzxqbiyzhrz@m4s7bjwc2fsf>
 <87h5id3he3.fsf@redhat.com>
 <SJ0PR12MB6806C8FCEDA2E3D40CA82EB6DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022114028-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806C7432951E2DB6CB3C945DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <SJ0PR12MB6806C7432951E2DB6CB3C945DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XPhpdjFx4OP9bj39Y5MfDGsCx8-ZUEE4kmn-fSHLMFs_1792684942
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 22, 2026 at 03:49:51PM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: 22 October 2026 09:12 PM
> > 
> > On Thu, Oct 22, 2026 at 03:35:51PM +0000, Parav Pandit wrote:
> > >
> > > > From: Cornelia Huck <cohuck@redhat.com>
> > > > Sent: 22 October 2026 08:35 PM
> > > >
> > > > On Thu, Oct 22 2026, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > >
> > > > > Let's define some standard way for the vendors to declare that this
> > > > > device is "Qualcomm", "NXP" or "hobbyist which doesn't own PCI or USB id
> > > > > block".
> > > >
> > > > Are we able to use the first <n> bytes of config space for that? I guess
> > > > that is the only way that can possibly work for any transport.
> > > >
> > > > Then, maybe something like one or two bytes for a vendor id (including
> > > > one for "testing purposes" or so), and the rest to be used in a
> > > > vendor-specific way.
> > > >
> > > device ids are independent of the transport.
> > >
> > > but Peter already announced that:
> > > " Reserve a device ID for QPSFI devices (Qualcomm Platform Subsystem
> > > Firmware Interface). QPSFI devices expose functionality across SoC
> > > subsystems through a common Virtio-based protocol. There are no plans to
> > > standardize the devices."
> > >
> > > So, I am unable to understand why should it be part of vendor agnostic virtio spec?
> > > Why a vendor specific implementation of device and driver is not sufficient?
> > 
> > I don't really think we should vendors burn up device IDs every
> > times they want something non standard. Reserving ID 52 as
> > "vendor specific" so vendors can go wild sounds good,
> > but a bit more needs to be done than just reserving:
> > document what is expected, e.g. no auto load based on ID
> > alone.
> 
> First, you indicate to open virtio to vendor specific extension. This is huge in itself.

Not as such.  It's just reserving an id. People always do things like
implement some crazy spec saying "we will upstream later" and later they
do not.
And then the ID conflicts with a standard one. Suboptimal.

So if we can tell everyone "always use this ID, and use platform
specific tool dor discovery, until your device is in the spec"
then that's not too bad.



> that should be first discussed.
> If you suggest this, may be every device type should be able to extend, and not just demux at device id level.
> 
> Second, one reserved id is not enough, because a given system may have multiple such different vendors devices installed.

I don't think we should care.

> So why to bend things so much and re-invent the wheel?
> Why for say PCI transport's any vendor and device id are not sufficient to indicate a vendor and device?
> 
> and if so, why to even document it in the virtio spec?
> 
> I guess, I am missing the basic motivation part.

For the virtio spec? Above. For Qualcomm since they decided never to
upstream - donnu. Don't care much, either...

