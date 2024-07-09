Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9500178CDF
	for <virtio-comment@lists.linux.dev>; Tue,  9 Jul 2024 13:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720531883; cv=none; b=aOK1+hPbEBGjL+mxIRhQMF8HHsvl8bKCnBkJjsmy4rEtv84YULuzVZM1pjETw1fJTG1SWdu28LlHWFG8qHS9kK4+evEcEkpzRkUvfacw0qQCj5VcfU6rHosOCcWw5o+JLefGQ6db8IFBKj6u1VZdiwew1j/AefvSecIYUOVwkqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720531883; c=relaxed/simple;
	bh=8dXEUshm815EAJpgRxys5a3xVXWbgWYJx1scPuBpRxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=MuvWBLveCucX4PuyN2Mp+AjF10PQ8f3JUJEXCRjpYwN9D/zEAPJLAJLWWQ5tvUXDABxam10dF8AwBx6Wo8av/Je1ZkOBumFe3Ob3PjlwL9s3+wiSWcuWoBJV6rdNCva3qvNcs6L0e4CRel54dXVlGfIfY/0FoMrDgDUTcckANPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HE6fWAEp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HE6fWAEp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720531880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=onetALu1f7DS9XjdEoR0oPaGTbYgzkZ5NrMqW0dHaec=;
	b=HE6fWAEpsu7EsxWP6q0Hn87ZmrBQq2ehy1071xX8BxTxc9Jfgz9mhNbToa4Pe9C8UrJbSk
	mAIOhaUZ2bYV8B9TPOiTy5RU81meb+nAiGvDAsP+0Ly/HkJhXBYu6jd++/wtuKaJ0r7vLq
	wzE+Gwh5mQi3AHxx8pSYw0i7TQzSUKs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-99-H3G4Vz2eM_6Xr7CuRsIEZw-1; Tue, 09 Jul 2024 09:31:19 -0400
X-MC-Unique: H3G4Vz2eM_6Xr7CuRsIEZw-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-36789d3603aso3336906f8f.2
        for <virtio-comment@lists.linux.dev>; Tue, 09 Jul 2024 06:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720531878; x=1721136678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onetALu1f7DS9XjdEoR0oPaGTbYgzkZ5NrMqW0dHaec=;
        b=kQzb0X2dDNqX0B1blAfBXjyk6D8u/14RX0ooSScvBRMSTF3z8mZ6Ecqos5MqeBU3sm
         oiDUCGtk4lckSedhdas97KQqGcaI97fzypqJeKerAyHjlU0361kQOzcqYdgGPps4SHjz
         3r3pU7D28x6WVbFtxYLZc+KRD3apHFT1ixdx9x9LeWM1SNhalSQV7wVHwajKuVhirvNF
         VSoCU5hKxlzDf4b9GMXACdnSEjYZxeJvkSJC9RCVA02NbNS2E1h7h6VfMA1An8Fll1ca
         nT463/MnStQDxFtWQg+n/2Ebn1NSkN0d9jfUXNX+p+7GjXd3Zr1revQs3JqXgBf6a0TW
         QTHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXC3odUkzkstKflLZJlYPycWcYZYU5w3ojk1sSVgBN0DSoLjNvpARw7oN0orfjCPDPS5LhhsEhOntZ2Zl+D1q5XZG1fBxPIO8sEPVeeUv8=
X-Gm-Message-State: AOJu0YwtYyy+ZYTTD4STy0Qpp7BUbbn0ijL9zZobid+4bNqBd9CLA3lt
	pDBLO6uS09zX7O8K5i8CMEvy2FddO7ubiGrbFVId5rUK2UNyrev0rAUcBfbVd6GG0viiCeTLcVp
	bzihd45YBOL3RCsKieXpNGRKtgQrLOa1D0Es2QqN0O6vL19EKI13nSvHPrvgSQtf+
X-Received: by 2002:a5d:69d1:0:b0:360:775d:f909 with SMTP id ffacd0b85a97d-367cead10a6mr1665386f8f.55.1720531878121;
        Tue, 09 Jul 2024 06:31:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVCMzpdFYDg45JoxuuL2i0HK1pdcoRtVDO9Zx6RRLeMPR3zapZe4YQxfuOqQguJtTJA9aEBw==
X-Received: by 2002:a5d:69d1:0:b0:360:775d:f909 with SMTP id ffacd0b85a97d-367cead10a6mr1665368f8f.55.1720531877633;
        Tue, 09 Jul 2024 06:31:17 -0700 (PDT)
Received: from redhat.com ([2a02:14f:174:f6ae:a6e3:8cbc:2cbd:b8ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfab1cbsm2601795f8f.100.2024.07.09.06.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 06:31:16 -0700 (PDT)
Date: Tue, 9 Jul 2024 09:31:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Keiichi Watanabe <keiichiw@chromium.org>,
	virtio-comment@lists.linux.dev, uekawa@chromium.org,
	takayas@chromium.org, dverkamp@chromium.org, tytso@google.com,
	Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH 0/1] A new virtio-blk error code for host-side ENOSPC
Message-ID: <20240709092959-mutt-send-email-mst@kernel.org>
References: <20240618081858.2795400-1-keiichiw@chromium.org>
 <20240619140024.GA57633@fedora.redhat.com>
 <20240703185505-mutt-send-email-mst@kernel.org>
 <20240709121447.GA505842@dynamic-pd01.res.v6.highway.a1.net>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240709121447.GA505842@dynamic-pd01.res.v6.highway.a1.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 09, 2024 at 02:14:47PM +0200, Stefan Hajnoczi wrote:
> On Wed, Jul 03, 2024 at 06:55:38PM -0400, Michael S. Tsirkin wrote:
> > On Wed, Jun 19, 2024 at 10:00:24AM -0400, Stefan Hajnoczi wrote:
> > > On Tue, Jun 18, 2024 at 05:18:57PM +0900, Keiichi Watanabe wrote:
> > > > This patch proposes a new error code VIRTIO_BLK_S_NOSPC to report
> > > > the device's ENOSPC error to the driver so the driver can treat it
> > > > in a different way from other IO errors.
> > > > More motivation is explained in fs-devel mail [1].
> > > > 
> > > > [2] is a prototype implementation in crosvm and [3] is in virtio-blk
> > > > driver. Idealy, the error should be propagated to the guest file system
> > > > and handled smartly, but the part is still under discussion.
> > > > 
> > > > [1]: https://lore.kernel.org/linux-fsdevel/CAD90VcZybb0ZOVrhE-MqDPwEya8878uzA1RBwd68U7x4CufkTQ@mail.gmail.com/T/#u
> > > 
> > > I have replied on linux-fsdevel so we can discuss a bit more about the
> > > context and get input from storage and file systems people.
> > > 
> > > Thanks,
> > > Stefan
> > 
> > Stefan could you also comment on whether we are likely to add many more
> > errno values soonish?
> 
> I'm not aware of other in-flight or upcoming work that will add new
> virtio-blk error codes.
> 
> Stefan

I'd guess the original approach is ok then, if it's going to just be
this error for the next X years, we are better off with a simple
change.

-- 
MST

