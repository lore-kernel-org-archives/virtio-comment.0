Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F7733FE
	for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 10:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718187080; cv=none; b=E7NiEMM6j/x/WaWDmJ8TUrDacUwksO5tbEmg9cRB+5IPkhStmtBQPEHjGqHRRPBUd/D1XlKQnurZRrHvKdlX0CaQf2CgZ4h17kB04pH+O0mlGr4v2IRhEdh4Ul8K7/TlETjS++c7I1dWtlbnAbarTT3GPJvHBFtzZjSs91PEQBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718187080; c=relaxed/simple;
	bh=G4zcCAXguYPZNA1ZoaKghk5OjLqq5qOnjnAH4X7w0F8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=U3e+D/UfSm80W/ddUsJwhznEl7almQXDzpFMwq5e+O/rCwhg0OfAVlyptbDKveAIFwfX+b3bkX2VGJvBkBi50kHM+XoUQRT0DzbrG5Hwc7PBdg4jP1Gh1lZWzbYSt2s6/RlEG7Wk6AB9F0746qcS83Ec8EfPndH3Nw9tmUMV8aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GfbunSkv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GfbunSkv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718187077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aTaF8I9dBBw9pE+VNJ+TPcuasdGOHN6CyvgAW9OW4Ac=;
	b=GfbunSkvElu2hjYNa85mClp7kWyZrrE/qUcyAf4tEsdmMwpj+8T5LUY2NxZ/wmtROOUGt5
	5Qfisq6CJclHDK83nIdJXM9zUO+WoLi6DGdQ5J++udK6deevq4iAXafhKp3t7z7pz2qhIy
	tN1PQXoa2asCgZoZIuhA2yIooIP3Vng=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-b9FurYGHOBmXTaMKlzLBiw-1; Wed, 12 Jun 2024 06:11:14 -0400
X-MC-Unique: b9FurYGHOBmXTaMKlzLBiw-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6b06f5e35b0so12643726d6.0
        for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 03:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718187074; x=1718791874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTaF8I9dBBw9pE+VNJ+TPcuasdGOHN6CyvgAW9OW4Ac=;
        b=sDDOarpwmbIMsKAuCNJAr6fHfD6lFJkGbe17AaqDaeVSSPtj0Lixe0g4+lLzDG4ne/
         LvZVvE+pA0Hh8oCPqUlx3E5zt3uaPM3O8d9ZF14oS6oWJtTjklVkMG+urfelyTiA7+J9
         mqmfsx3/9faxJzpmLsx1AOAodpr7Fy8t1pMUmWMBJJBmPgIJgNVFATTZ6L8oiuB3U7T9
         CedSFsxZlsa9Ql0TvtnHkC9IztKhNOgDVUawE7LwYfp/zozu+jZZlSC5UDRP1VkgRqtJ
         xq77vdmYa9Pu5ixHXEcaUwoBxc8tpl1VFh0XAnT+vxbP0bFBIn2TNIX+jxm+IewCw7nv
         D3Gw==
X-Forwarded-Encrypted: i=1; AJvYcCWLH7rUF6IVz8TK9tNW/r7Li8+O9dkLbF8jiC/exrDcDj5cfe0WAp+WxJCbDkyPxbEwToNIKSdP0mMTCF51QJ5C8yLqn5zHfQo3ME4Yw2M=
X-Gm-Message-State: AOJu0Yzk7dS4uRH8pa0wLb8YpYmCG7KnsFopasaH3d6RkkEasC9DmtPB
	1rPzih2Zwde/4olD/qCQnqyaregKdLs2I+ZzL7hYjEclR0mVsZBn0VSDu11dNPuZSK/OnSalf20
	wQlf0CQWEvQWWffDDIyOx9vUWV8hg3FxxusGBjlIPy7J1vExiEENufGxdB55aet/7
X-Received: by 2002:a05:6214:310a:b0:6b0:7c8d:8057 with SMTP id 6a1803df08f44-6b0c9f25744mr18338616d6.2.1718187073759;
        Wed, 12 Jun 2024 03:11:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDOQzb37Deab2Dk3jUwXuqJMhCTqLWCuJosuvJp7Grbhyt9DYMk2Eh48nJzmM3JEDrI/LQsA==
X-Received: by 2002:a05:6214:310a:b0:6b0:7c8d:8057 with SMTP id 6a1803df08f44-6b0c9f25744mr18338326d6.2.1718187073326;
        Wed, 12 Jun 2024 03:11:13 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.151.203])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b075e37080sm37505946d6.46.2024.06.12.03.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 03:11:12 -0700 (PDT)
Date: Wed, 12 Jun 2024 12:11:04 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: hi@alyssa.is, mst@redhat.com, niuxuewei.nxw@antgroup.com, 
	virtio-comment@lists.linux.dev, fupan.lfp@antgroup.com
Subject: Re: [RFC PATCH 2/2] virtio-vsock: Extend the spec with an `order`
Message-ID: <oxfm5jjjim3tv6q22o4mr2oidz4yljjs4lmadcccfbkdlrudrp@fo7wkwb2p3up>
References: <qhikhsdegxqpvluwe2m3cbq7xclyol5qnnag2lqsd3cpwlqkvu@jbu7utft67ih>
 <20240612062442.2429221-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240612062442.2429221-1-niuxuewei.nxw@antgroup.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Wed, Jun 12, 2024 at 02:24:42PM GMT, Xuewei Niu wrote:
>> >Add a new field, named `order`, to the `virtio_vsock_config`.
>> >
>> >There are two questions about the field that are valuable to discuss:
>> >
>> >(1) Do we really need the `order` instead of a `default_device`?
>> >
>> >IMHO, the answer is yes.
>> >
>> >The `order` is more generic than the `default_device`. The device with the
>> >lowest order is the default device. Moreover, the `order` field determines
>> >the sequence of devices in the list. The device list is the same every time
>> >the system starts.
>> >
>> >The device with lower order means it is more important. Also, it means it
>> >has more likely to be used. Those devices are placed in the front of the
>> >list for performance purposes.
>>
>> This is an implementation details IMHO.
>>
>> BTW perhaps the biggest point in favor of `order` IMHO is the fact that
>> this works very well with hotplung/hotunplug, since if we add at runtime
>> a device that is to become the default, we don't need to change the
>> configuration of the previous device.
>
>I'll rework on this. BTW, shall I add this to the document? Currently, they
>only exist on the commit message.

Maybe yes, what about adding a new paragraph to describe the 
multi-device support?

>
>In addition, I think "index" is a more proper term than "order". So I'd
>like to rename it in the next version.

Yep, I agree.

>
>> >Last but not least, the `order` represents a sort of priority, which might
>> >be used in the future. For example, assuming that if there are two devices
>> >that are eligible to be used, the kernel will return a device with higher
>> >priority.
>> >
>> >(2) Why is the type of the `order` `le16`?
>> >
>> >The maximum number of devices, in the implementation on the kernel, is 16
>> >for performance reasons. The users could compile the kernel to support more
>> >devices. The type of `le16` supports up to 65536 devices, which is enough
>> >to cover most cases.
>> >
>> >Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
>> >---
>> > device-types/vsock/description.tex | 16 ++++++++++++++++
>> > 1 file changed, 16 insertions(+)
>> >
>> >diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
>> >index 3fbc02a..dc3bd66 100644
>> >--- a/device-types/vsock/description.tex
>> >+++ b/device-types/vsock/description.tex
>> >@@ -58,6 +58,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
>> > \begin{lstlisting}
>> > struct virtio_vsock_config {
>> > 	le64 guest_cid;
>> >+	le16 order;
>> > };
>> > \end{lstlisting}
>> >
>> >@@ -83,11 +84,26 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
>> > \hline
>> > \end{tabular}"
>> >
>> >+The \field{order} field is required while the multi-device feature is
>>
>> We should use the feature name, so something like: "is required if
>> VIRTIO_VSOCK_F_MULTI_DEVICE feature is negotiated."
>
>It will be updated on the v2.
>
>> >+enabled. A list is used to organize devices.
>>
>> This is an implementation detail.
>>
>> > The field is used to determine
>> >+the order of the device in the list.
>>
>> I think we should not talk about a list, because that seems too close to
>> implementation, but focus on the meaning we want to give to the
>> ordering. For now I think we can only talk about the one with the
>> smallest value being the device used by default.
>
>Ok. These will be removed.
>
>> > The device with the lowest order is
>> >+the default one when no CID is specified.
>>
>> "no CID is specified" in which case?
>
>I'll elaborate a bit more about the case in the v2.
>
>> >+
>> >+The rules are:
>>
>> "The rules" for what?
>
>The rules is for the new field "order". I'll update it on the v2.

Yep, I think we should be more clear on what the rules refer and who 
should respect them.

Thanks,
Stefano

