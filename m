Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1DF2AEF5
	for <virtio-comment@lists.linux.dev>; Mon, 13 Oct 2025 08:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760342487; cv=none; b=Dg3jQAOgUNai5KaejoQutpBiFR5bxBr/GeV/FUe/6VOjJsOu8C5WjRBa/kT/2AjeH41C1jsD8Ode2sFiqN5Wc7YiIjTi54YcCNilG7ta6RLZN2kYpaMZmddFxtWG1yC4goNDSmzZa6q9rURs2EVXGvtj6zUslD4qFsjecn2puZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760342487; c=relaxed/simple;
	bh=M/La4FPuJgGY9nUPLH8lwbd8ujVrae5mmCMeqADO/XU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=mZAd6nG23ku0hy+t7OS+3qoovVIXb2MtQWjmuUHciehijuwXD8GTWvgGmlhE3Bgz2HFQLXq6+gLqi6GGd5tAgjG+AXlhG0KbkvcKpwDd1CXcV910ow8eCr+lwdPAloruJUV8K9YrKmFkkLPWAGr4vzlzJlU/vNMizsTO9CTXPlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cj/6ant1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cj/6ant1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760342483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DNUiJZu5/AVJH9ijcgeF9Flw7tN6XFz0DRx7FvHpOtc=;
	b=cj/6ant1Bxi46/F+OXGGfUS/HafcF+f0lwSqR5xiPCw938XKbBZJzshtALGJFdlvWGRakb
	Dg6oGt/BsvEl0owHIxUY9KBFKZK6W+aBKKQ/8wjruI9295J14TQ8ga7YW9Cklri4XWBTnA
	WO6Gu/TttgQ1p6Ta2G4DZ0a7WCTPl7Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-HoDPIBlZPEWDKK3h3FNFvg-1; Mon, 13 Oct 2025 04:01:21 -0400
X-MC-Unique: HoDPIBlZPEWDKK3h3FNFvg-1
X-Mimecast-MFC-AGG-ID: HoDPIBlZPEWDKK3h3FNFvg_1760342480
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-46e509374dcso15484405e9.1
        for <virtio-comment@lists.linux.dev>; Mon, 13 Oct 2025 01:01:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760342480; x=1760947280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNUiJZu5/AVJH9ijcgeF9Flw7tN6XFz0DRx7FvHpOtc=;
        b=NdA1MKNBb1AZopfcg6r3hOnOdgo8/c9LpAnMRYTJUop6bNtODnROWzteE6zKTGViwA
         kBvMRUrJSaxQ8lv5lBuaNcXymnb5u77XbR+LQkp797D0ArcEuk54Yf46+YqZD1bbQCWl
         sqqj4XrAuK9i3OkyFBMhra3PDVZn1YS0YDRUVJuX7QshB1GeMRJgDlVLNXrEIyjjx0rV
         Bw4aqw1ov2CEtmVVFtBCFkQ6Xxqguo0lTBhcIWQNtXW4TjcOUTVlsv/I3XT/MlZaHJfV
         Wfbdd53wE9JaOcQRr08Uav+x1VK5mGkyUVuDG0N+cbJlj+JKc9AB2AKoNFKgpVcNSLwO
         8+Ww==
X-Gm-Message-State: AOJu0Yxnh7YBK3Dxbvk4u7xkQ42q2QYaBNZxw5cVElyAnyCynazLW6vh
	l3GalPMRAEJbmL9QzhbZneIVx2am36MfTbKInujaco+TP7lY6shczA5Nffxftsd8i6uC5tFpuFj
	Z1yIE8KDWFKqL7jicxCADF6N2itv3RVX0lGXKM0a6MAHWw5JdeoJmaFxjUTSBGFrQhxREFZhtaV
	ysyhazMNOzZpM2AXDcpW60laAbDQhESRobjy6cN4IgSiCbhQ==
X-Gm-Gg: ASbGncsTmqR9WYHm9phYGOm+7LhbECHgY46Gs1eqerLuQKK9ZOwBsfAPl+NM+NpTiPR
	aVvNQmnYBoArY/0dxbQL0afOxdcoH2NiOUvMstJD5mxmlHUy0SgDtwBlS9bbaoCJUAkM6/+CfBj
	lsuzigIKerhF2LcjaWHL4i/Kuxofyd/RHXmcQCJss6bA0BkNkYhPtEZjWLUNyTnW3EaOPFJmX7O
	U7YGmSmSYuAl3ScdKhHIa963rKgr+B2DCmu60eQ2lDIu20Hn4yPRz20GUtrvES53chNUr1CZf1L
	YRhpyXDiGa+68kDT8Crgif9PlilZ8w==
X-Received: by 2002:a05:600d:416a:b0:46e:3f75:da49 with SMTP id 5b1f17b1804b1-46fa9b11794mr138857365e9.37.1760342479557;
        Mon, 13 Oct 2025 01:01:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECTlviA/Pjod/BU6B0WucTzcFrc0+bpasAt+NRdADo/OMOK/HGtFeKwTmf1cUhENzhzC5RjQ==
X-Received: by 2002:a05:600d:416a:b0:46e:3f75:da49 with SMTP id 5b1f17b1804b1-46fa9b11794mr138857045e9.37.1760342478964;
        Mon, 13 Oct 2025 01:01:18 -0700 (PDT)
Received: from redhat.com ([31.187.78.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb4983053sm171928405e9.8.2025.10.13.01.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 01:01:18 -0700 (PDT)
Date: Mon, 13 Oct 2025 04:01:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev, Filip Hejsek <filip.hejsek@gmail.com>,
	Maximilian Immanuel Brandtner <maxbr@linux.ibm.com>
Subject: Re: [PATCH] virtio_console: fix order of fields cols and rows
Message-ID: <20251013035826-mutt-send-email-mst@kernel.org>
References: <7b939d85ec0b532bae4c16bb927edddcf663bb48.1758212319.git.mst@redhat.com>
 <aOyHZnkkLQBCMAa-@codewreck.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <aOyHZnkkLQBCMAa-@codewreck.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k6Bg2aoGP3eZFZbLbH2DL7PQFyVORg2MflTX-E_eXVI_1760342480
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 13, 2025 at 02:00:22PM +0900, Dominique Martinet wrote:
> Michael S. Tsirkin wrote on Thu, Sep 18, 2025 at 12:18:47PM -0400:
> > While commit 5326ab737a47278dbd16ed3ee7380b26c7056ddd in Linux made it
> > match the spec, no one seems to have implemented it yet host side. It
> > seems better to just drop the change (it was only in 2 releases so far),
> > going back to the status quo.
> 
> FWIW, there are other users of the spec e.g. bhyve, which implemented it
> "right" (cols, rows as per the spec -- since 2016):
> https://github.com/freebsd/freebsd-src/blob/main/usr.sbin/bhyve/pci_virtio_console.c#L148
> 
> or crossvm (also cols,rows)
> https://github.com/google/crosvm/blob/main/devices/src/virtio/device_constants.rs#L293
> 


Indeed, thanks for bringing this to our attention.


> I didn't look to see if there are others (probably some of the other
> rust hypervisor crowd?); I'm not involved in any of them but given there
> are other implementations I'd personally think it makes more sense to
> continue the work of "righting" linux (that is backport the order
> fix)...?

Yes, this is what we normally do. The reason I wanted to do it
differently here is because I did not realize we have implementations.

> I don't have any beef either way as long as the qemu patches aren't
> forgotten (thank you again Filip!); hopefully this can help reach any
> kind of decision.
> 
> If this was discussed somewhere else I'd appreciate being pointed to
> it :) I "only" found the recent qemu patches, an attempt to revert the
> fix in linux that was held back, and the stble backport thread where the
> issue was raised but not really discussed either way.
> 
> Thanks,
> -- 
> Dominique Martinet | Asmadeus


OK I guess ... let's get the ball rolling with backporting the Linux
fix?

-- 
MST

