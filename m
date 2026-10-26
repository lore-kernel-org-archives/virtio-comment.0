Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793022244;
	b=Pw0IDguqBh85X8awr5w+oZ44IzK4U9G5PIjVJi4bkkeFGvTST6R9qTbNRLj9PSThW+/1
	 zP8znJMvTCpiujFQ5ko9olPVqYAeBGjhjMk9HBPeOlTTdoxUdNmNWlsJPcTrsrl1dkeOo
	 fj/QkX8FDh/57PbMacbKteR5ISRuW6fSK12Qib//v0sH+5pU4hEnqOI7wapzjpHU7Leyz
	 blP2zAKXZ+X25eAbBd7Xlctlm2LoP8oBUSPzx4FgaVSXEFq/1yC6VQbwZchDI0OTQh0tY
	 QXgD6b7fQsCRuW0d2ZyfVhl2uQAJnA+buUWodvbA+S56AWumhG7uGYTGg/QJerwR7mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793022244;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Disposition;
	bh=1jtJReYRyqdsrFZjdueNFI4v0PWkzXe673TTWmiTniM=;
	b=PsxQ1D6jhjfyot7vX8+JYlfngvzJpK7eZmD3kK+IjvHm1ljdWZwywiGvI9+Ma4+wJcyX
	 S1LFw1NuHzFPShV7uJMC+BN/XViGwaKZmZdc51G92jw9VNLWIKt4Ta3AI841fD+MLm7O5
	 WeWC4BRoicgL/p9GJNitJW9sBreHd0IUu3hazERgstunTVTltMZ/CTOItLg7CQ/ZOOCk2
	 UsKlFrE5jTlwWcNIeao8EvvmNrvE+qGOF9K6CCsI+3SdZ8S5YledMuHvQQQh10mo75JT1
	 VVnc9z6OANasHz8Y8FdZgs/SFGTT5cEkPWjbsFF4oBGyX67nDWPfMvmx5156VplxqoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LVT8GEel;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C790606A31B
	for <virtio-comment@lists.linux.dev>; Mon, 26 Oct 2026 13:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C790606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LVT8GEel
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793022243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1jtJReYRyqdsrFZjdueNFI4v0PWkzXe673TTWmiTniM=;
	b=LVT8GEelHpvXBQwCdF8Xs4rGJKyFp2zNciFh74zbIyI7NroYbH5j8azNMnHHPnOHqmvjdo
	k2y+QXmHsZl6BpyQ8gNb7rizpLz5b5xv11MfkRiMDb1ycyvLTcJERlGBEPE0x/AHRfsPsl
	Z6eug57q9OJ2qo98byx96Olu9+F5BZA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-PiYjQFndOkWHB-VNhpnbHw-1; Mon, 26 Oct 2026 09:44:01 -0400
X-MC-Unique: PiYjQFndOkWHB-VNhpnbHw-1
X-Mimecast-MFC-AGG-ID: PiYjQFndOkWHB-VNhpnbHw_1793022240
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a2001e85c8so22439095e9.1
        for <virtio-comment@lists.linux.dev>; Mon, 26 Oct 2026 06:44:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793022240; x=1793627040;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1jtJReYRyqdsrFZjdueNFI4v0PWkzXe673TTWmiTniM=;
        b=CtMtBAjd80an2IR5Xqp1H2TqarVL4RlX24EYJtPQvZMWG3xMuKhpFvtYXTGw7TN1Pe
         bWvBGgQDRY8u4Sj7Jbg+vcixXrMxqZSex+KaSsmwjrewnQjmAYaKdEjLhRKuFaKuWXID
         BXSw5b86qPkBgAgbLVYwSxBZzKDur+5NBgm+39ODtvtjoDykStL/XUNzmdgKNySnzS/t
         yhA74wAvJ5Bwu8Zwdw4s0S6/7UZ5G+RC7PmHwpQFPETghOTUz7QQHMlQBGtaC1bXUa0+
         oeP0KMiBIg9SVYk72xStzKgA6wk+yo5GXJP865s/itDmgUO+xBAWHd5XTUnJMdgo0w2W
         i9HQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyVuXNf2uJExigI2lMFFMmmV22Xa4UO9WlcprsVSvWOy2kELWxq5fPxDhTTXB+lHYP6PKERvSRMO09FMLsmQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYIZrCPWx/1nyjRE7RB7PkZrB0oifNQlsFTYRxAMrAcIJKxijpIA
	pls2oY5E3eb9pnPaBpoxMTygCBjOZ1eDzcIOVZK1sqlZ8u157KHF/na4MSdxlJ3YJ3jfPl3sY8F
	QwtTODH4N6xVHrc1OFKGWDIbTZLUM8/sCj/tLX72tO5RJFYWlla3B+GsG8Nesap/YHSl+
X-Gm-Gg: AYBFou3Do41aQVkDjMV3x7D+CVvq7jCY8eS3GKSi51u/Cv6tUCcOp3SWLko3+2EPnUv
	ywwcUaLf+lLf1rMtvo2qR4y2MsUl1p4hWvZ/TdhQgDZkqARXX3cVey/ywnB1+GO3/xBMx2qRPaS
	sRAWUKwpHodoTKDoIw9zWCbmPUUbdgDzZj0N2R5XJuY/68U2hqZ+6Cij2nnLAQIwIE9BxlRMAP6
	8RPJDU0zxxoEeZFq8T54KbqNtfIEQutqQ1I4cOF1wwoZ4u0paLOS8oSIX0ifdDCat7Nm2l7kcPv
	z0rjrbvzn+bFGIDHVYtoD5RDleoOGNdXJwdphzh2m1AtjvV+QEUopQBdysxd5BT3Exw=
X-Received: by 2002:a05:600c:840e:b0:4a2:b89:b02 with SMTP id 5b1f17b1804b1-4a35acafc84mr115422245e9.10.1793022239688;
        Mon, 26 Oct 2026 06:43:59 -0700 (PDT)
X-Received: by 2002:a05:600c:840e:b0:4a2:b89:b02 with SMTP id 5b1f17b1804b1-4a35acafc84mr115421575e9.10.1793022239010;
        Mon, 26 Oct 2026 06:43:59 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa0bcsm245511405e9.4.2026.10.26.06.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:43:57 -0700 (PDT)
Date: Mon, 26 Oct 2026 09:43:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ruben Hakobyan <hruben@meta.com>
Cc: David Hildenbrand <david@kernel.org>, Breno Leitao <leitao@debian.org>,
	Atish Patra <atishp@meta.com>, Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Alexander Duyck <alexander.h.duyck@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH] virtio_balloon: batch large descriptor chains for page
 reporting
Message-ID: <20261026093445-mutt-send-email-mst@kernel.org>
References: <20261025200808-mutt-send-email-mst@kernel.org>
 <20261026125911.753798-1-hruben@meta.com>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261026125911.753798-1-hruben@meta.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: V7tlSzLhBvWYl0EB56sK8B44J1jaCz15_sXXnl2SCeg_1793022240
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 26, 2026 at 05:59:11AM -0700, Ruben Hakobyan wrote:
> Sorry, I just realised the other reply went on to the wrong thread, so just
> reposting it here.
> 
> On Mon, Oct 26, 2026 at 12:19 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > On Sun, Oct 25, 2026 at 04:56:41PM -0700, Ruben Hakobyan wrote:
> > > On Fri, Oct 23, 2026 at 11:04 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > Great patch, thanks!
> > > >
> > > > On Fri, Oct 23, 2026 at 01:19:19AM -0700, Ruben Hakobyan wrote:
> > > > > The virtio_balloon driver reports a scatter-gather list of free pages
> > > > > to the VMM so it may discard unused pages.
> > > ...
> > > >
> > > > It's not just a question of convenient, is it?
> > > > Rust is buggy wrt to spec as it allows only U32_MAX.
> > > > So it is also to make it work.
> > > > So should we maybe fix Rust to be spec compliant and allow 2^32 too?
> > > >
> > > > I think we should definitely recommend U32_MAX in the spec
> > > > because otherwise it can not fit in the used length.
> > > >
> > >
> > > Thanks for the review!
> > >
> > > Sounds good to me, I will CC virtio-comment@lists.linux.dev as
> > > per your recommendation.
> > >
> > > Agreed that Rust-VMM should also be fixed in case 2^32 needs to
> > > stay the hard limit. I think here for the driver, we can be more
> > > conservative as long as we stay below 2^32.
> > >
> > > ...
> > >
> > > > > ---
> > > > > The wording in the spec is a bit ambiguous because it uses "chain
> > > > > length" for both descriptor counts and the total size of the memory
> > > > > ranges referenced by the descriptors. My read is that the byte limit
> > > > > applies to the sum of descriptor lengths, which is also what rust-vmm
> > > > > checks.
> > > >
> > > >
> > > > quote what you are referring to please, also in the commit log
> > > > not after ---.
> > >
> > > I will update with quotes in v2, thanks.
> > >
> > > >
> > > > I would also CC virtio-comment@lists.linux.dev - spec should recommend
> > > > U32_MAX.
> > > >
> > > > >
> > > > > Another option I considered was to limit reporting capacity based
> > > > > on the largest possible block. E.g. for 64 KiB pages, the largest
> > > > > block is 512 MiB, so limit the reporting capacity to 7 to stay
> > > > > below 4GiB. Although simpler, I found that the time to reclaim
> > > > > was quite a bit longer.
> > > >
> > > >
> > > >
> > > > So I was going to apply this actually:
> > > >
> > > > https://lore.kernel.org/all/b541ff170218bd5d45b551b5132e7cf2c490d761.1780906288.git.mst@redhat.com/
> > > >
> > > > which makes the question completely moot.
> > > >
> > > > Does this have any effect on performance?
> > > >
> > > > Thanks!
> > >
> > > Thanks for sharing this. Yes, this would also make sure we stay below
> > > the limit. Regarding performance, I tested this on QEMU and it calls
> > > virtio_notify() after each completion.
> >
> > Who, QEMU does?
> 
> Yes QEMU, sorry for the ambiguous wording.
> 
> >
> > > Using one chain per entry
> > > creates more chains, so QEMU can use more CPU time to reclaim the same
> > > amount of memory.
> > >
> > > If we go with this, I think a QEMU patch to batch notifications
> > > could reduce the overhead. Alternatively, I think we could create
> > > larger chains here but make sure they stay within the 2^32 limit,
> > > and keeping your approach of queuing them all before kicking.
> > >
> > > I am happy to share a patch with my thinking here.
> > >
> > > ...
> >
> > Oh. It's just the driver being silly and never disabling
> > callbacks.
> >
> > pls just add virtqueue_enable_cb_delayed and this will fix it.
> >
> 
> Ah great, I tried with virtqueue_enable_cb_delayed() and yeah it
> largely fixed it.
> 
> So regarding the patch in
> https://lore.kernel.org/all/b541ff170218bd5d45b551b5132e7cf2c490d761.1780906288.git.mst@redhat.com/
> 
> I see it's in a larger series, so just wanted to check if you're
> planning to send this patch separately? Or let me know if you'd
> like me to do it. Thanks!

Yes please do send it separately. That work stalled, the mm guys said
they will have someone look into it, then never did.

Or maybe even simpler, as below. BTW we might want
virtqueue_enable_cb_last, instead of delayed will be more efficient for
event_idx.

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 799b575a3828..dc94b417b14c 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -246,22 +246,23 @@ static int virtballoon_free_page_report(struct page_reporting_dev_info *pr_dev_i
 	if (nents) {
 		virtqueue_kick(vq);
 
 		/* When host has read buffer, this completes via balloon_ack */
 		for (i = 0; i < nents; i++) {
 			struct scatterlist *entry;
 			unsigned int used_len;
 
 			virtqueue_enable_cb_delayed(vq);
 			wait_event(vb->acked,
 				   (entry = virtqueue_get_buf(vq, &used_len)));
 			virtqueue_disable_cb(vq);
 			if (used_len == entry->length)
 				set_bit(entry - sg,
 					pr_dev_info->zeroed_bitmap);
 		}
 	}
 
 	return err;


-- 
MST

