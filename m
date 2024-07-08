Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDF9156E4
	for <virtio-comment@lists.linux.dev>; Mon,  8 Jul 2024 10:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720434410; cv=none; b=CtJdUIV3O22oYnKgEXLLM4wJ39s7fSgFkCvx/SgnD1UKBLqboj4fA/lTACA2f1nK8M5/bWjrsCbfL7KVp5A/WbE2oSsd53/Ei5FquHAEVYvAq4mf62hF3mI72pNJx4tVOT7p/2OO6fnXIs1UX8Vmybi1Dr4SgdEd7Gd7ZZX4wvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720434410; c=relaxed/simple;
	bh=/KNnqaVktLfXBuEOycyKzHy1XrFtKrctZryDnhbXi3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=a0CPLXeKB5UBblgOpm4D27GiUtlwVDq8YCMo4of1ZNh1ERwtKgFvNuW/DJYvZnv/0Kv7sNh485E9zOL6BuKMzWY7uvQhg6B33YlbURwyIw147QNOj5FO5LuBPS2AUvhJsuDyRBt2OpAUI+6eYZnwee80Pe7U4vfffTW9DJ+Rsc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ep0M5RZq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ep0M5RZq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720434407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U/XDpPomNHzjDDSnhafuC6fsQ6DcBkSO/LaoiDqCmJ4=;
	b=Ep0M5RZqgKdWEDcQheEO1VacA4GtVJeLUz6BrVxHN++DfA63nUeKd5FIHJLr+UYAreI1Lv
	KazouUX2Ne7B/IABuHTmidD4SWqivoPXnYvrVvSRObKbwOIK/6fnw+oUAL60jleebew53H
	bjCJeYrQpRDDSZNGcmrYrCJOqaQW930=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-xGJM_w5XOvOTY13Rt2DUTw-1; Mon, 08 Jul 2024 06:26:45 -0400
X-MC-Unique: xGJM_w5XOvOTY13Rt2DUTw-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-6533680c788so55941997b3.1
        for <virtio-comment@lists.linux.dev>; Mon, 08 Jul 2024 03:26:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720434405; x=1721039205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/XDpPomNHzjDDSnhafuC6fsQ6DcBkSO/LaoiDqCmJ4=;
        b=NL+DDp6QJZ4zrKqLeqRr7W5Eh+O3yM5b7+xk154zKJ/0mSP+UKv/1cLNBu3xC0XtTA
         yGij0ZOXCECmQkq2e6tf0CR6MpOBLqioD5EGsY3uqfHhnzsYCGMEvhuf9+E9YyBilo4x
         XmYWaGPdw7h/rmcQvYdrcqQ9S0kUaCZ1EbTIz5Z/7jddm6pNEz4//2S5opA7jZBDeJ8/
         VbummS4liHH3IzAJex/MC6rGvZgeKBWE6TItCkdTLugNY7/dyFpKtBK2IJNNVBCf0/lz
         Y3kWxjbVH+s0p93mzReNn0TDWOHhWhSdCWDhiYaDyx6ERfI30DplhOwCV462unmseKHT
         hzDg==
X-Gm-Message-State: AOJu0YwHAa5cXEaJaXXa9BbK8+Eoa8NWbfSvvcDNDOBFPyWuA8j1065M
	Sk+QOH6ZD9/Y4M8++RDiQIG2RxQWZlcUId1LKJwksAxivFatF1mPppZlIkS0jjWv1qBGRrD6OKA
	YydDZ1tVPfKYVx/q8ttE4J1c4Y3X3q8pFP4NuBZu6NiVzzpenMuitL9vt/5QP4DgY
X-Received: by 2002:a0d:eb89:0:b0:650:a1cb:b122 with SMTP id 00721157ae682-652d6d9a26cmr107154827b3.27.1720434404936;
        Mon, 08 Jul 2024 03:26:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkaYQ3yPb/Pa977U3kmTeQb30V8+eo+dAy5XtcO0yt9tuuomoJ4l8iW+9ULV92fqr/fQ5scQ==
X-Received: by 2002:a0d:eb89:0:b0:650:a1cb:b122 with SMTP id 00721157ae682-652d6d9a26cmr107154737b3.27.1720434404603;
        Mon, 08 Jul 2024 03:26:44 -0700 (PDT)
Received: from fedora (193-248-58-176.ftth.fr.orangecustomers.net. [193.248.58.176])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79f0326eb34sm249977385a.33.2024.07.08.03.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 03:26:44 -0700 (PDT)
Date: Mon, 8 Jul 2024 12:26:41 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Harald Mommer <harald.mommer@opensynergy.com>
Cc: virtio-comment@lists.linux.dev, sgarzare@redhat.com,
	Matti Moell <Matti.Moell@opensynergy.com>
Subject: Re: [PATCH v1] virtio-can: define out of rage can-id and sdu
Message-ID: <Zou+4XKJFaAVdoRK@fedora>
References: <Zn1IJT/awG4NZijw@fedora>
 <9d76d8ae-6cfd-4693-ae41-03415923f764@opensynergy.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <9d76d8ae-6cfd-4693-ae41-03415923f764@opensynergy.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 27, 2024 at 03:16:35PM +0200, Harald Mommer wrote:
> 
> On 27.06.24 13:08, Matias Ezequiel Vara Larsen wrote:
> > Explain when a message is out of range.
> > 
> > Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > ---
> > v0 -> v1
> >      * Use length of the field wording to indicate out of range
> >      * Add when sdu length is out of range
> > ---
> >   device-types/can/description.tex | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> > 
> > diff --git a/device-types/can/description.tex b/device-types/can/description.tex
> > index 2511d9c..fa56abd 100644
> > --- a/device-types/can/description.tex
> > +++ b/device-types/can/description.tex
> > @@ -191,6 +191,14 @@ \subsubsection{Controller Mode}\label{sec:Device Types / CAN Device / Device Ope
> >   invalid state with VIRTIO_CAN_RESULT_NOT_OK in \field{result} and MUST
> >   NOT schedule the message for transmission.
> > +Note that the \field{can_id} field of a CAN frame is out of range when its
> > +length is more than 11 bits for standard frames or more than 29 bits for
> > +extended frames. The length of the \field{sdu} field is out of range when it
> > +uses more than 8 bytes for standard frames. If the VIRTIO_CAN_F_CAN_FD feature
> > +has been negotiated, the lenght of the \field{sdu} field is out of range when
> > +it uses more than 8 bytes and is not in the set [ 12, 16, 20, 24, 32, 48, 64 ]
> > +bytes.
> > +
> >   If the parameters are valid the message is scheduled for transmission.
> >   If feature VIRTIO_CAN_F_CAN_LATE_TX_ACK has been negotiated the
> > 
> > base-commit: 37c6a406678a5ee891fdf5671298cb4fcfa517f2
> 
> "If the VIRTIO_CAN_F_CAN_FD feature has been negotiated, ..."
> 
> Would mean that sending a CAN classic frame having an sdu length > 8 over a
> virtio CAN device capable to send also CAN FD frames would be allowed. This
> is not the case. The condition is the type of the actual CAN frame to be
> sent.
> 
> Decisive for CAN classic / CAN FD is the presence or absence of
> VIRTIO_CAN_FLAGS_FD in the flags.
> 
> Having an automatism to change a CAN classic frame to a CAN FD frame or the
> other way around under some conditions is not in the spec.
> 
> For example: "If the VIRTIO_CAN_FLAGS_FD bit is set in the \field{flags},
> ..."
> 
> Or "If the frame is a CAN FD frame, ..."
> 
> 

Thanks Harald, I will add it to v2.

Matias

