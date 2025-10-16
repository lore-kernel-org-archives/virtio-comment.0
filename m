Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804FC2BCF6C
	for <virtio-comment@lists.linux.dev>; Thu, 16 Oct 2025 06:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760595466; cv=none; b=qNZDQ3eUvZ0f/Wmj7JfU2XZDDQOU8kQmP3GLDXJCFQpbL/gCgT4pICN2+MMoCAgytds1e2Dmy/QbWydqdj/v+gHRN4Hmbuk6E3V9JqZkgyDpGw6OFQZOWzctAp6VPGqfs7vMqjULEuTYOB/evezbE/JWc4u8vxELsablhDTEiaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760595466; c=relaxed/simple;
	bh=TtYcRr6M7EPFleSNsf7BkmUcrjZwn619t9kD5vcD5ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=qyhkWaAOqJ0LMnCU8xbIHAlDcWpuEPoTPogtoiKljqHQy+3tDk+y0XQ+VWkvLbdEyhKWHfwqv3FhskcvrHqVgq9HTnwTyMWdnf66MLcwafOUV8GGS378IZAUailoX/Se7uGWtN1JJoFomJiOc+AF35GdyJB3LANYympqCeirM14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WHZJlrbV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WHZJlrbV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760595461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rr4UMZKEf3Cqs757IcABLGLA5WgmZGsyUvLJVamr0z8=;
	b=WHZJlrbVV0Y4qenP+uJaQKWVFKHGoD7joXwiQhI1l7JrW44tpnDpMILiU8l3DS9ApK92i2
	EvB5439zFnCKULjOzKpaywJ0n+R8pwTyGve11Vra4Gh0PhWKiIfKqnE1cr34JUkWe+ZOfq
	ke3dbdCBtZ2F9UXWDWGRzela9yo3aEo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-lxqHyysMNX66A_8Wv-mRDg-1; Thu, 16 Oct 2025 02:17:40 -0400
X-MC-Unique: lxqHyysMNX66A_8Wv-mRDg-1
X-Mimecast-MFC-AGG-ID: lxqHyysMNX66A_8Wv-mRDg_1760595459
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-42700160169so128754f8f.1
        for <virtio-comment@lists.linux.dev>; Wed, 15 Oct 2025 23:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760595459; x=1761200259;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rr4UMZKEf3Cqs757IcABLGLA5WgmZGsyUvLJVamr0z8=;
        b=P9gV4J4Md4wHxqk2YjnrTNmXdfmaZjcqCgQanIYDTi56bf+Z0Ea+JSvlpaVaX+ESnb
         qMBjQM1U1YYS0mVMUU+B4GZOzbDa4XOrNP+j1Ul6OW2dPfeYFVJzvwqZdsUOoX42PR+L
         BQwa6P9bhAL7edKYNE8+/MrRGOeh9STOEFeJ2G51D4oRluie0qHYArC9BS/aPXcpKdFs
         1ln6BbSxNmloL1sgRWRkzHGlgLs9486SKhOw8oEFRfEAiKg9Z7bMsrhKH076OYC5zNl4
         tkaytmE/yj+wPwKqGYufDk9Ij0j4KaC9hNXy62xh0Fmk3/TdSqLDuOTTqhuIVfk5CTBn
         kFwA==
X-Gm-Message-State: AOJu0Yxk/oApTnQAXb9Rr/1pLoWGdgbvzo5R1bFBG4DE0WttP6EGs7/5
	AY/7vx3p6+viPMK4GFBx2/sAFxiMRKF8gdeLu9FvwsWRmmZauU6bz3athi+6FUfWbUCERNOZ2QI
	u+mLOS19eocoAK3x7n2EeR/AEQ4glTxJ7Er8aQHpXK5uYGbsMT5GGYJ+LeTzhXuTVCa9M
X-Gm-Gg: ASbGnct8RaTgaSaGLWgDxs/EymGc0wAakDzqX8iE3+5p9Sj2HBga3l0oQ9NapdNinuD
	4gNS59UJvJMRoyi30ENuh4PCmP9p1xxH9cmIBHaB9Nzz742Ku4r4+S4CsMCmdtWZvSzvFrQuc+R
	nLw2m31VcKfklt/nDnVfirclwYL0JRnyA6MgzvoQyo7TCk7dzEqcfCA8Lu3GwXlrEl93qpw2qQn
	ev1Imx+cU9lmXT+zZwXmPCX/a7R2sjMPT+J4tA9y8QGg7UnWzsBCkeRsLlHsf1svY9kN6B8ykQu
	iGgSxIKLgupPmYwQW0nKR1sBBy/UgrmQL4tmE/kVwbPAGrMb92NvGK83O9snxXoG8YWJ
X-Received: by 2002:a05:6000:240a:b0:406:87ba:997c with SMTP id ffacd0b85a97d-4266e7df82fmr20132994f8f.40.1760595458917;
        Wed, 15 Oct 2025 23:17:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEji5Lu46Een50Sn+4/sa666aqSWBAVzX0GFZMkU5zWbefKXnDXTYhyxDbhN05A/CJtfWH4kg==
X-Received: by 2002:a05:6000:240a:b0:406:87ba:997c with SMTP id ffacd0b85a97d-4266e7df82fmr20132977f8f.40.1760595458432;
        Wed, 15 Oct 2025 23:17:38 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152d:b200:2a90:8f13:7c1e:f479])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42700072619sm1343411f8f.46.2025.10.15.23.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 23:17:38 -0700 (PDT)
Date: Thu, 16 Oct 2025 02:17:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.linux.dev, lulu@redhat.com,
	nguyenlienviet@google.com
Subject: Re: [PATCH] virtio-net: introduce TSO limit feature
Message-ID: <20251016021717-mutt-send-email-mst@kernel.org>
References: <20251014042243.22087-1-jasowang@redhat.com>
 <20251014044005-mutt-send-email-mst@kernel.org>
 <CACGkMEs7Y9DLuRp_3ex8ac3Hv5y7X5Q-PnS61DMjOVjAkvazjA@mail.gmail.com>
 <20251015024018-mutt-send-email-mst@kernel.org>
 <CACGkMEt77EDs4MKo9RSnXRxuVD8hZFca+W3mAxv6sQ3sWN-xZw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CACGkMEt77EDs4MKo9RSnXRxuVD8hZFca+W3mAxv6sQ3sWN-xZw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LFzIfvLzLGE49QbQw5o-v6jmQg-o4-TkQyEO9bLRZmU_1760595459
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Oct 16, 2025 at 01:46:58PM +0800, Jason Wang wrote:
> On Wed, Oct 15, 2025 at 3:02 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Wed, Oct 15, 2025 at 12:29:13PM +0800, Jason Wang wrote:
> > > On Tue, Oct 14, 2025 at 4:59 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > thanks for the patch! yet something to improve.
> > > > I note issues only when encountered 1st time but please
> > > > do go and check all patch for each issue.
> > > >
> > > >
> > > > On Tue, Oct 14, 2025 at 12:22:43PM +0800, Jason Wang wrote:
> > > > > This patch introduces TSO limit feature which allows the device to
> > > > > advertise:
> > > > >
> > > > > - Maximum TCP length of a TSO packet or inner TSO packet when UDP
> > > > >   tunnel is support
> > > > > - Maximum number of segment that can be produced by the device after
> > > > >   segmentation of TSO or inner TSO packet of a UDP tunnel
> > > > >
> > > > > This is a must to implement TCP jumbogram, as networking stack needs
> > > > > to know the limitation of the device in order to produce TSO packet as
> > > > > large as possible.
> >
> >
> > Maybe you can provide an overview of how this all is used?
> 
> Sure, this feature does not implement BIG TCP (jumbogram) itself. BIG
> TCP requires a little bit more to be implemented:
> 
> 1) new gso_type for jumbogram
> 2) when TCP length exceeds 64K, we should mandate ip->tot_len to be
> zero and device can judge from the length of the buffer
> 3) other stuffs
> 
> I guess this is something that Viet wants to work on.
> 
> But before BIG TCP, the driver needs to know the device limitation of
> TSO packets. That is what this patch did. BIG TCP is not the only
> user, it could be used in the software datapath as well. Consider a
> simple datapath:
> 
> virtio-net -> TAP -> bridge -> eth0
> 
> If eth0's tso_max_size is less than 64K, we need to advertise this to
> virtio-net otherwise 64K gso packets will be segmented by software run
> xmit in eth0. We've encountered this in collaboration with mana and
> virtio-net/vhost.


Well then pls update with the real motivation.


> > I am looking at tcp_fragment and I just do not see
> > where it looks at any device limits.
> >
> 
> It works like a device advertising tso_max_size/segs, and it is capped
> by gso_max_size/segs. The gso_max_size/segs were the ones that are
> used by the stack to determine the skb->len.
> 
> Thanks
> 
> > --
> > MST
> >

