Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAC51C6BD
	for <virtio-comment@lists.linux.dev>; Fri, 21 Jun 2024 14:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718980068; cv=none; b=EfUcLSJYDLehwWeVCzjriWTKjoAJb/iRKo4wkYFeaTvc05XweyIdbucMxXZqv50uawLV1gLRuJXYC/Z0mjmUKSUx75pT7Hf37ZWFaToe3xKqMn95KtAWdPf/pqHORNHYro76yuFqINLwxd+Dflr/PqMjwM4OsEiP2sD56DZOZ54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718980068; c=relaxed/simple;
	bh=Cana3uqj5VDUNNoJ/F9+G9QXYQ3lCO3KORli3c3tRN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=YAUSNjCUI8B4cFNXPQTq4tUVfDjV9ful4nNwUXpWTBtNAGNpgL9h3yZ9MManFoFjhgRfAdPI0fjyrVBHxOsonOq3eoEagpsZLNVC4AETXJrveRJMTxq2dVdX1diFxoIqZbq+qrXuFaGmXMPPApkMQ7qTQH5el4/uvFYIJlsk+tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ekyRB+Py; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ekyRB+Py"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718980066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eLCnJISRlWoWL8Flgy3G9uk2CyN3QDsAgz/ckxrf5Ts=;
	b=ekyRB+Py2A48DmItAuDr6G6ic6L3wU+sGKPnFl+J3LNdL8Gtdx53W2ae9KtnZQO5Eqcgtm
	WYn2Qo7si8GyhD90yiw9dbks1jqcc9PMsK81JHibj2Z5faIseL8yoBuUK7A6VGjbYnOPy6
	zyx9p8sckVMKDmSp90v8UaNyA8x/KgM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-V-xZ7Q82PTatBsDeKnfx0w-1; Fri, 21 Jun 2024 10:27:45 -0400
X-MC-Unique: V-xZ7Q82PTatBsDeKnfx0w-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3644be85453so1097498f8f.0
        for <virtio-comment@lists.linux.dev>; Fri, 21 Jun 2024 07:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718980064; x=1719584864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLCnJISRlWoWL8Flgy3G9uk2CyN3QDsAgz/ckxrf5Ts=;
        b=nqWqqdCyEfVEvjPBfwq8Jr/7taIwHGhpbc/qPdnqe+lLAgdAuRDIFUW8tU/CRkCpoN
         qjGePGHzih3nLE5N8CNt4lVxSY9C23E70UWlF+7jMSmowlgEU45k7Q3TtlqrVEIry5Dn
         M5c0rpgXsyyAvbKDn8uCR+eHRtVEfoE2xHyg85dJ03jFLaNA6qUE7Gr7NQtRIUeoeiu9
         ackzk0L1tjXOAf+fiLpMbs+gGiyzuhOoeYlrN3jdcpbMvYc5Rhn1rRIiZIkU5cy+73M7
         W/vhr5qjr3f9eyQVCm4lcvTaOH1qCNBbxgz7SPZYCgvtCriux8wA7eprSthfoWcYfxjS
         9p2A==
X-Gm-Message-State: AOJu0YxvDxMNZM01rXt4KbjDkNv0rivx6IS28FN2UfK0gb9TwzEdglqL
	cJ6t6dwtoUgX0f32rG5V0WeIlr56XQ3n3yVumdcs8T2X02wkQm7M9rctv8xidblsxjKItzxBN/o
	HDIcUxZI3bhh2Xiq/hcGZfM1jMJ2iWDiMEoNzRJpY/iJkC3H4a+BJpfgZpqKKqV8Fj5uPU4yt
X-Received: by 2002:adf:fe0b:0:b0:360:8200:858f with SMTP id ffacd0b85a97d-36313edebd2mr6875718f8f.0.1718980063808;
        Fri, 21 Jun 2024 07:27:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDGQnPty5zpsJYAXMqlpoeIdwyv29w8cQuiAZMgS4cUB4C3TscCGhFfMp7slLQPZ6TpHLyzg==
X-Received: by 2002:adf:fe0b:0:b0:360:8200:858f with SMTP id ffacd0b85a97d-36313edebd2mr6875699f8f.0.1718980063435;
        Fri, 21 Jun 2024 07:27:43 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366388c401asm1889528f8f.45.2024.06.21.07.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 07:27:43 -0700 (PDT)
Date: Fri, 21 Jun 2024 16:27:41 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: virtio-comment@lists.linux.dev, harald.mommer@opensynergy.com
Subject: Re: [PATCH] virtio-can: define out of rage can-id
Message-ID: <ZnWN3ePT6G6nL3N9@fedora>
References: <ZkyrnsCXu8mQpDQI@fedora>
 <pf656j5da3lxgo2nn6nvhyz7tutf2rktbwxzddyhenyyvhzxpx@is6fo76auxms>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <pf656j5da3lxgo2nn6nvhyz7tutf2rktbwxzddyhenyyvhzxpx@is6fo76auxms>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 05, 2024 at 10:42:19AM +0200, Stefano Garzarella wrote:
> On Tue, May 21, 2024 at 04:11:42PM GMT, Matias Ezequiel Vara Larsen wrote:
> > Explain when a message is out of range.
> > 
> > Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > ---
> > * This patch applies on top of virtio-1.4, which has not been released
> >  yet.
> > ---
> > device-types/can/description.tex | 3 +++
> > 1 file changed, 3 insertions(+)
> > 
> > diff --git a/device-types/can/description.tex b/device-types/can/description.tex
> > index 2511d9c..98b163b 100644
> > --- a/device-types/can/description.tex
> > +++ b/device-types/can/description.tex
> > @@ -191,6 +191,9 @@ \subsubsection{Controller Mode}\label{sec:Device Types / CAN Device / Device Ope
> > invalid state with VIRTIO_CAN_RESULT_NOT_OK in \field{result} and MUST
> > NOT schedule the message for transmission.
> > 
> > +Note that a message is out of range when a standard frame uses more than 11
> > +bits of \field{can_id} or when an extended frame uses more than 29 bits.
> > +
> 
> It's not clear to me where we refer to an out-of-range message before. I
> only found "\field{can_id} or \field{sdu} length are out of range" where
> IIUC we talk about the length of certain fields is out of range. Are we
> talking about the same thing?
> 
> If so, I think we should talk explicitly about the "length of the fields".

Yes, I will rephrase it by using the "length of the fields" wording.

> Also should we cover `sdu` as well?
> 

I think we should cover it but I am not sure when the `sdu` length is
out of range. In the reception section (5.20.5.3), the spec states:

`If the feature VIRTIO_CAN_F_CAN_FD has been negotiated the maximal
possible sdu length is 64, if the feature has not been negotiated the
maximal possible sdu length is 8.  The actual length of the sdu is
determined by the length.`

For transmission, I guess `sdu` lenght is out of range if the length
does not fulfill the requirement above but I am not sure.

Matias

