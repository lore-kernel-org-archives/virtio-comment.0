Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCB113DBA8
	for <virtio-comment@lists.linux.dev>; Thu, 27 Jun 2024 12:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719491726; cv=none; b=iFgcLgSmAthtqGHHVRJhkg9K/fhLWdq7NS77OWs9e+6py3kmknQ8cK9LZWV1a7wTZacMo21C/zdFIx5O5yhBzsVdp06j8hUimLJ6Mpyu9rR3ql1kCpCDPl4E0c+bltFFUShz/D4VN0YoY8zRYp2jfrljVAMDQmycW6xHg6WGh8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719491726; c=relaxed/simple;
	bh=mbbaPDxy+ki9WfYm890sAT7K1R9qgPr77F5oQxnX2Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=nBaFmO8XcRIwl0VjzoayXXB9i+e+QUArreR3+KcviLHblVQhGll777HEL7TwOpg96bZuMu7nydARpNhStUHuEL44pEvs+6rsPhUil+Aur9g3jG9U71mPd3MAfZxYZFiIPl44UYza2BtD9ll+FEcGpDPCwHdVb7TKcGcsehT54zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J1K5vjcI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J1K5vjcI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719491724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v7V0txnGji/J7aPbu+ZA5FnBtxZy3bC6XY07WHCOWwQ=;
	b=J1K5vjcIUHn1NfjLb2I6YeolMexmFyCvZZ1mlVLHGIT9iL9Sq7AQXcSPsmgM/qsp1gnhMs
	IiT9xYJuF2CwF7p5Tzln9Z9uXt9fgub/3O7OUdQYkOgKYqYiTzlHMJvxKDxpY7V4NOOslh
	YOWohjJ8h8F6FlZLcNOJkzdd2Z4wwi4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-0Xq1PZVRMpG3s797BuDjpg-1; Thu, 27 Jun 2024 08:35:22 -0400
X-MC-Unique: 0Xq1PZVRMpG3s797BuDjpg-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4255e9f5897so9649045e9.0
        for <virtio-comment@lists.linux.dev>; Thu, 27 Jun 2024 05:35:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719491721; x=1720096521;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v7V0txnGji/J7aPbu+ZA5FnBtxZy3bC6XY07WHCOWwQ=;
        b=j2iTEBtiJPDJ7o1yYT0eKxzmpPkj4fO/V6XIcLs46Mfz6ocw46BWMt+VkEAN8cfRcQ
         OjT0gxdAuj/ILZ3p1ZxD3G0RG46XFPvJP4dGwee5lD7KWxCVdyz+ZG/BAGgQNAWrEJUP
         XmcUAZDRfcRQ4IR5A6Nx2sRrIk9Mza+ubH5HsqHEUl9UJONUdgfJ9YWcGRH5CmgBUnav
         McZC83eGg7YpxXDV7dF2E7EdrR3NW835Q8hR5jMvamifTc165jTsG1bbaBwhJloKH9c4
         93P+BOkpUWbuZ3fjWLYHNsrtBY20lhYI0jyYPwsR3khUksYwCwWdDETtAPKaMkFQ8StT
         vL8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXnF9ETjZp5lK6HflwtYTX8ZYgDKzZBGC7nucLlu3JNSiO/PjNk4OByA8qOIMaPyL3SaLYWn9NN/bOJbpHlEW3VnFLAJI4VApRVge/MkuQ=
X-Gm-Message-State: AOJu0YwDMObtBtjaWB8SMFEpHmjoGOCN+FYjBt63YBkroingW+9KMg6R
	q3Q4EJoRnKIbx61grluyS2hxMas10Xg0HfTmviBA8cEabwnZoB/T3ZFLCrE5LO/sXmz0zZNCCug
	9P37zYmdHkRsS2WUjclGSpeZSFCYKIxtLgZ3hYJZaTJAMxWVAwiIikmJoLLEsR89p
X-Received: by 2002:a05:600c:b41:b0:424:ada1:6d9 with SMTP id 5b1f17b1804b1-424ada107famr34931485e9.34.1719491721079;
        Thu, 27 Jun 2024 05:35:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHL/bwY9ftpKi9W1TVQ+rU/ON92GvYFtDx7hZinfTR8+3Zz2JyOr2Fy/uaeXVtlBOvq0WB2HA==
X-Received: by 2002:a05:600c:b41:b0:424:ada1:6d9 with SMTP id 5b1f17b1804b1-424ada107famr34931185e9.34.1719491720314;
        Thu, 27 Jun 2024 05:35:20 -0700 (PDT)
Received: from redhat.com ([2a02:14f:177:a007:5be4:b928:19f7:7c2e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42564b6675csm25158215e9.17.2024.06.27.05.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 05:35:19 -0700 (PDT)
Date: Thu, 27 Jun 2024 08:35:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Cc: Si-Wei Liu <si-wei.liu@oracle.com>, Parav Pandit <parav@nvidia.com>,
	Heng Qi <hengqi@linux.alibaba.com>,
	Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
Message-ID: <20240627080346-mutt-send-email-mst@kernel.org>
References: <77ec85ae-0f50-4093-b499-3b6defec4ade@oracle.com>
 <1718869209.8824844-6-hengqi@linux.alibaba.com>
 <e774e811-27ba-4151-b300-e22161f1b4d5@oracle.com>
 <1718940245.6932242-13-hengqi@linux.alibaba.com>
 <b9e47c91-46aa-4526-b441-de48906f1ae4@oracle.com>
 <1719020069.8729858-17-hengqi@linux.alibaba.com>
 <f03e76fe-9ee8-4000-b41c-0b284f2f237d@oracle.com>
 <PH0PR12MB54818CFB447152A25130F9B8DCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
 <bca1e5e8-65af-4825-b6fe-2ca3b6c41feb@oracle.com>
 <20240627123732.0cf541b3.pasic@linux.ibm.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240627123732.0cf541b3.pasic@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 27, 2024 at 12:37:32PM +0200, Halil Pasic wrote:
> On Tue, 25 Jun 2024 18:14:15 -0700
> Si-Wei Liu <si-wei.liu@oracle.com> wrote:
> 
> > On 6/24/2024 10:56 PM, Parav Pandit wrote:
> [..]
> > > I saw the need of this proposal slightly differently in the discussion with Heng in v4.
> > > The way I understood is, proposed relaxation enables below Linux driver flow to work as equally as without device offering VIRTIO_NET_F_VQ_NOTF_COAL.
> > >
> > > Flow is:
> > > 1. The device offered feature VIRTIO_NET_F_VQ_NOTF_COAL
> > > 2. The virtio-net driver negotiated VIRTNET_FEATURES that has VIRTIO_NET_F_VQ_NOTF_COAL
> > >
> > > 3. Because VIRTIO_NET_F_VQ_NOTF_COAL is negotiated, device is not applying any coalescing on the VQ, in a good hope that driver will perform VQ notification coalescing.
> 
> I have certainly understood this differently. When
> VIRTIO_NET_F_VQ_NOTF_COAL is not negotiated then the device is not supposed/allowed to do any interrupt coalescing (notification suppression may still apply).
> 
> If VIRTIO_NET_F_VQ_NOTF_COAL is negotiated the device is supposed
> to/MUST do the coalescing according to the parameters as described by
> the virtio spec.
> 
> Michael, Jason: Can you guys weigh in on this?

I still don't understand why this change is needed.
We have this text:

	The device may generate notifications more or less frequently than
	specified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.

and

	The behavior of the device in response to set commands of the VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
	the device MAY generate notifications more or less frequently than specified.

So with no spec changes, devices already can do what this patch says they can do -
send notifications less frequently.

Re-reading this spec text, maybe the confusion is that it mentions set
commands specifically? And it's also stuck in the middle where it's easy
to miss.

So it would seem that the following should be sufficient, and it looks
like a small clarification we could just apply and include in the
vote for the csd. What do you guys think?


Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

---- 


diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 76585b0..d6788df 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -1711,8 +1711,6 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
                                         for an enabled transmit/receive virtqueue whose index is \field{vq_index}.
 \end{enumerate}
 
-The device may generate notifications more or less frequently than specified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
-
 If coalescing parameters are being set, the device applies the last coalescing parameters set for a
 virtqueue, regardless of the command used to set the parameters. Use the following command sequence
 with two pairs of virtqueues as an example:
@@ -1726,6 +1724,9 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 \item Command6: VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET with \field{vq_index} = 1, the device responds with coalescing parameters of index 1 set by command5.
 \end{itemize}
 
+The device can generate notifications more or less frequently
+than specified by the coalescing parameters.
+
 \subparagraph{Operation}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing / Operation}
 
 The device sends a used buffer notification once the notification conditions are met and if the notifications are not suppressed as explained in \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Used Buffer Notification Suppression}.
@@ -1798,7 +1799,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 Upon disabling and re-enabling a receive virtqueue, the device MUST set the coalescing parameters of the virtqueue
 to those configured through the VIRTIO_NET_CTRL_NOTF_COAL_RX_SET command, or, if the driver did not set any RX coalescing parameters, to 0.
 
-The behavior of the device in response to set commands of the VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
+The behavior of the device in response to specific coalescing parameters is best-effort:
 the device MAY generate notifications more or less frequently than specified.
 
 A device SHOULD NOT send used buffer notifications to the driver if the notifications are suppressed, even if the notification conditions are met.

-- 
MST

