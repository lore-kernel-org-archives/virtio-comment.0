Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB02D1AD3E0
	for <virtio-comment@lists.linux.dev>; Thu, 22 May 2025 06:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747897173; cv=none; b=XnhYy4c/HO8R8X7MxG9N6f9dTQCnCmB2xUcrPplon8n+oI3GdNjdcN5Qih9cA5BmnqGUaSiacsVF4HoR0R37a+F3ZHJGuO1rshl0wUvDyb71Rs16Mf/Wez59VXY9f9e1df81yoNgO9JRnIFxTPXH69ts+idRduyY7IV5GS4Ezlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747897173; c=relaxed/simple;
	bh=KPVVg6YLBTKLN/xUBklTxBnw7Dud3iMHSouUzKuoLkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hRu+lJtI9ZD5TVALuQZswUlvvFHwqAXY09RqtiRVmMbIHsiVW1mvI+a52XaQWN2RT8gBFH6r6dOkPaJzItQ1J/T+KboeIJqn/bwIz6R446pcx60r6Sn0+f/iJg2Om0k+2gnzt50yyp1brtfQpSY57iHz7E7vpZ6fhBEmX9EXUOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QeVKG/5k; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QeVKG/5k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747897169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KPVVg6YLBTKLN/xUBklTxBnw7Dud3iMHSouUzKuoLkI=;
	b=QeVKG/5kFxgCnvK1VZiHiThriFXIhX4qmUTCTMbFPDYmdkHw5/xhcQI2fYPJz5qXs6FX+f
	eiQFqn+UzL1Il/KCn7pN97V6ffZGJ8SmhkdcRewwqdwcNvumfpkg3OZjXhAXGf4XObNMZP
	Ky7y7puhBTRc26Ii8k/Bj5yQzE4dyu0=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-jLuGWmOJMyu-QA7FMJ4yXQ-1; Thu, 22 May 2025 02:59:28 -0400
X-MC-Unique: jLuGWmOJMyu-QA7FMJ4yXQ-1
X-Mimecast-MFC-AGG-ID: jLuGWmOJMyu-QA7FMJ4yXQ_1747897167
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23228c09e14so65957855ad.1
        for <virtio-comment@lists.linux.dev>; Wed, 21 May 2025 23:59:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747897165; x=1748501965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KPVVg6YLBTKLN/xUBklTxBnw7Dud3iMHSouUzKuoLkI=;
        b=CTHn6fvOMYbmqXMfgXqjevZ2rQtsAl2Zky+nGhpZ07YsSYRiXx7ZuoGn+vtpbPbGfL
         SNJcIX+Z9u3E5wf2JUaYEZ+BtglbXG5ck2HA4MFdPehxYXXH242LMHnBRl3DmwK/Rs3n
         oJZswxkNjWBwDEGF+FAbBmTzg2Nab2Up5Qd2D6V1+68wZ0DAn2Yz/Vmp7TXsmFFllXm4
         jQlAKslTlRhHibHvVdsvCsi/TpeVZcU/wJds72LXMP+MNLyC1jveD1yWZLcEqt/WlFBd
         n2XFjHyFiwBILTbS9pOepzQAKGJOuk1oKPO3mqb0PeC4JeROjMHAD/wrpMs6E/TSI7cq
         SVBg==
X-Forwarded-Encrypted: i=1; AJvYcCVQn1YeWq6GZLygt/eiO2bz6mV43dzZAh0SvhFngev6Y/a2h9eSBmDYBfPHE/6UI043qvZ75NqBHAMjJgcodg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwmUfzoKF2RzLNl7bwDyg99EQB6Zd2KLVX81PysOSj3CXtLSiFm
	usFqt7I+WVnFvI1O21WwZB/yzIYU3yHzptJ6AdTUh2s9o4APP+Jue6VNEvAC50CvDbQJgi76CAF
	Tl87okZbSN3DnCOy3u28aRsrIrEJvBSew4antPXnsddPr6jqUwrElgdmZt2GeMghIzeUt64uymW
	joVt2oNSjWmjvEW0KZXE2E+OIX/nHSX0168rmuGACToMU3ebfyv5hX0qGj
X-Gm-Gg: ASbGncvwxlDKkRWa23myzBlBaUuLYBXWYC3PG4nHDe0ODka7wKqF0HeC1VtVoxMVWIr
	w9+bwTwKnChlgrvimW4m1YSEUR4jv/wu4LJrMugkBJYqJLLKio5FbOGhHUnJOe4lGbbAFsw==
X-Received: by 2002:a17:903:41d0:b0:22e:4cae:596a with SMTP id d9443c01a7336-231d4511384mr284363895ad.20.1747897165626;
        Wed, 21 May 2025 23:59:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSNsIVXEOPKct0M3DUD+ttJ892DxQIUMtIN5wZJ0O/TR0ZKRvWgrN2otE0IMwlXM8IuV6UqAio+ix3vcjvI1w=
X-Received: by 2002:a17:90b:3c51:b0:310:8d54:9e7d with SMTP id
 98e67ed59e1d1-3108d549f28mr8660945a91.5.1747897154326; Wed, 21 May 2025
 23:59:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250521102049.68666-1-lingshan.zhu@amd.com> <aC68Kj5XI9bJXf5P@dev-qz>
In-Reply-To: <aC68Kj5XI9bJXf5P@dev-qz>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 22 May 2025 14:59:01 +0800
X-Gm-Features: AX0GCFs8VE7nh-czNaqy2iqUQGjFM_shyLzGgGVVW621s_wENdKPbgaSDz5noUE
Message-ID: <CACGkMEsJBB3U--yUKPvbCBLO_cdrQ0pJrRx-P9B_haMU_8cNng@mail.gmail.com>
Subject: Re: [PATCH v1] virtio: introduce SUSPEND and RESUME feature
To: Qiang Zhang <qiang4.zhang@linux.intel.com>
Cc: Zhu Lingshan <lingshan.zhu@amd.com>, mst@redhat.com, cohuck@redhat.com, 
	virtio-comment@lists.linux.dev, Ray.Huang@amd.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Yg9I7ppvsX52PHUcRLklMlneHUF-J_N4hDy_xwvmjk8_1747897167
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 1:56=E2=80=AFPM Qiang Zhang
<qiang4.zhang@linux.intel.com> wrote:
>
> On Wed, May 21, 2025 at 06:20:49PM +0800, Zhu Lingshan wrote:
>
> Hi Lingshan,
>
> Thanks for your great work! I think we need more WRT suspend feature.
>
> Virtio device auto resume and guest wakeup features are not included
> in this patch. Since they are very related, can we add them this time?

Consider we've spent a huge effort to converge the design in
suspending. I'd like those to be added on top.


> For example, virtio input device may need to expose auto resume and
> guest wakeup capabilities present on USB mouse, keyboard etc.
>
>
> > This commit allows the driver to suspend the
> > device through a new device status bit SUSPEND
> > and resume the device running by re-setting
> > DRIVER_OK bit in device status.
> >
> > This commit re-orders the device status bits.
>
> A rough idea:
> A wakeup capability feature bit and a enable/disable control bit are
> required. If wakeup is supported and enabled, device can automatically
> wake up itself from suspended state to running state and raise a
> configuration change interrupt.
> Hypervisor can implement guest system wakeup basing on device's wakeup
> capability.

I'd expect this depends/requires transport support.

Thanks

>
> Thanks
> Qiang
>

