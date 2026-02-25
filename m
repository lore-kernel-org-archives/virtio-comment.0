Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF25719D081
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 15:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032525; cv=none; b=pMfd3pWQ1Ji9g1mfkMEAZqGLqKZC++lEvQUqeYsDa1WdX2APP7PLMCC43SxbQaIZ6NodeMcd/WQVMoDOEBgJkXuorYSnCNwQiEMiKvw9vbevXuotIDbDGhg6U0+UcXY1Ma5iYuTrNZVZiHwzVHQSi0faBf4FMkRfFmgapVWjCbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032525; c=relaxed/simple;
	bh=wbxkUq645zS8rTyjsxSErYybFHZ8DS9YN2RCyWQlMK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=YU6JXlLAqi4tPTa9j1VT1XWMI2n9Mhf0aMGnvKiMkDWZB24H2jr4sk1LkUNMo4S9KkMToMhUJqacbhgJSQhtUchPPgRSz6fXGZaFCohitcMp5kfqDi9hdLVzURWwj/tOqFIgagDqGQ5DcuexuqnBrEoNaLIdPDEYeQ5RyAEj3Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bhzufQNY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bhzufQNY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772032523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CfLDgWYUMwJru08ncnjoU6wh0Tt1xsM3afgHKyDsz/w=;
	b=bhzufQNYmnnJkWxNBvpwRrPxVC+Hw2K+pWp283+xT4IWdgb0i92d+JXEW7rgkCt94Vy3VB
	S4CW36YN+mH3KQKkBNLDBWhBf2kzZae5+XD/Df4nkpB9yjXmQ57SWhyCPWXpMO3t98f0WY
	6LzcEYDAVVFniLq3ok9zpGCOVnaZDFo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-RzZusaPWOvqy7rFfuFV42g-1; Wed, 25 Feb 2026 10:15:22 -0500
X-MC-Unique: RzZusaPWOvqy7rFfuFV42g-1
X-Mimecast-MFC-AGG-ID: RzZusaPWOvqy7rFfuFV42g_1772032521
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-483bcfdaf7dso17382845e9.0
        for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 07:15:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032521; x=1772637321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CfLDgWYUMwJru08ncnjoU6wh0Tt1xsM3afgHKyDsz/w=;
        b=dTlKC6F7ycu/MeSW1NVXxkSi0NiY+2Z4j5jTiqCF6Jp9+fH/iu8yi6e+IaY+UGBhDe
         4wi3L+waCSzLOJ30Ct1aI7nqQZljS4S8jtfQrT/PRIbCsn0ExxrTyaACIVMzFGWUJ3hH
         9AxGCDAU6CcabAVRH4+dNp+f6qQ9Dwe9ZarZ/BdIKO1k7kKho0lThqEh7Tl08UpXTRjU
         v5UsP/l0F0mAJgwJm5DsLeIVUz6PIaeWeoc2thzHbTkW6TK9KtS1Zh3gRlXYLhCEtvD5
         xx90tx4Hl2zAubbY2HYQb/5T1LSdvAMeijFooIczX3itupIBKQIATSxcLsD52dojVBx8
         qIWg==
X-Forwarded-Encrypted: i=1; AJvYcCXeBS+20hKwR8Bi8FWURWTNpKF54cZ9d6DoRe/FJRjhnKOZYwxWnXfDY5jUa98WpoRR+AxsxTbOmdWHSSptHA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwvRZkW3jaeRzvyq/GcqTnPOtIq9IlFfpb0so+5i+G6KPbibO+e
	vGvzXbRtfY41HDAaNaUlECYPDPeIsgivI+td+AtsaIfNQWMb9HtkHPvOVcF+LaVOS6XGnmfRC6t
	xcrTOp+auRe6WC3cv5iBMZPpPU+2g6MBNpqPmhMoJ1DEIbB1Hv+hWMUD2OszyhNKiBm6m
X-Gm-Gg: ATEYQzwWl/Bd/rvWB1x1CrthGiM9MMeIQzvV7sm+0YLTjTEM9LkXe1cMnKm3RkDZacr
	9tPA1tmH6Tyl4Ve65oFo99wo8SVgdWhhrI906t2qvCU6Reiuas8zMl6Zr2u5runUQ6GjlK6v8tC
	xgfC37maDQjZHNXLaJM+ZUPOwweWmJKtKxdaw5z1m46YBf1H/BwBVIJ7CHlGTVoCnGlNB5pLTum
	Sp2b9LUWcc5ut5+YZ9ANsYzJxkSWM9xZhuDltwdvu3BHCzYQGKUTY9tXbnFC6kqk40CLFEUgyIV
	txswLyhy82H3YStT3ufvANA5GQTjURxM+Rt5UNQtDt7a8IDPJ8Cfa4mTTwkmCnCxOHQ5d4UDoi9
	FeVWjM2IXcug4vyq2VZ/HTtAChZOp09LG1+Bkh6NslHpWsg==
X-Received: by 2002:a05:600c:468d:b0:480:7162:fa48 with SMTP id 5b1f17b1804b1-483a95c8f2dmr303513795e9.13.1772032520938;
        Wed, 25 Feb 2026 07:15:20 -0800 (PST)
X-Received: by 2002:a05:600c:468d:b0:480:7162:fa48 with SMTP id 5b1f17b1804b1-483a95c8f2dmr303513045e9.13.1772032520373;
        Wed, 25 Feb 2026 07:15:20 -0800 (PST)
Received: from redhat.com (IGLD-80-230-79-166.inter.net.il. [80.230.79.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70b3f3sm82558005e9.6.2026.02.25.07.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:15:19 -0800 (PST)
Date: Wed, 25 Feb 2026 10:15:16 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Parav Pandit <parav@nvidia.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	"Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Message-ID: <20260225101404-mutt-send-email-mst@kernel.org>
References: <359B0C17-9D57-423A-A229-6CEDA19C975A@arm.com>
 <dyiwq5xhqeoaqmzquzzx4wxsptm6uvrnfgspi6vmcaucq6jn4l@6dvya4te4vsj>
 <SJ0PR12MB68068259D212C6AC8B6A5DEADC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <02226901-7670-4AAB-8F55-0B2FB7C0CA49@arm.com>
 <SJ0PR12MB68068FA1D1893B774C5A8A15DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260225094902-mutt-send-email-mst@kernel.org>
 <8B4F5FE2-1F80-43BE-A60B-5C24B69C8B4E@arm.com>
 <SJ0PR12MB680642C4277CBAC888052FDEDC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <SJ0PR12MB6806151DD9BF3AEF3839FB62DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <E24A071C-02D3-4465-99A9-732FB4EF49B7@arm.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <E24A071C-02D3-4465-99A9-732FB4EF49B7@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4un2I2rrVfKJudmnufo8h6kBFi_4HYNf0KQg2E0aH1c_1772032521
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 25, 2026 at 03:12:11PM +0000, Bertrand Marquis wrote:
> Hi Parav,
> 
> > On 25 Feb 2026, at 16:07, Parav Pandit <parav@nvidia.com> wrote:
> >
> > Hi Bertrand,
> >
> >> From: Parav Pandit <parav@nvidia.com>
> >> Sent: 25 February 2026 08:30 PM
> >
> > [..]
> >>>>>> So the PCI device is not one virtio device but one bus behind which there can be many devices.
> >>>>>>
> >>>>>> Is this making the concept a bit clearer ?
> >>>>>>
> >>>>> Yes. This makes a lot of sense now.
> >>>>>
> >>>>> This is a virtio-msg-transport device that needs its own device id in the table.
> >>>>> And its binding to the PCI transport.
> >>>>
> >>>> ok. how about an rfc of that idea on the list?
> >>>
> >>>
> >>> I will let Edgar answer on this.
> >>>
> >> Sure.
> >> Also please explain how is this different than SR-IOV devices?
> >> On a PCI device there are some child devices exposed using some virtio-msg bus transport.
> >> And all of them are going to share same PCI BDF.
> >> These individual devices cannot be mapped to different VMs (secure or regular) in a performant way either.
> >> So what would this virtio-msg-transport device achieve?
> >>
> >> If there was no PCI bus when implementing the virtio-msg transport, it would make sense to avoid trap-emulate story.
> >> But underlying transport being PCI, its back to square one for the originally described motivation.
> >
> > If the objective of the virtio-msg layer is to really support FF-A or similar other non-PCI transports, lets please focus the discussion on such use case and binding of that specific non-PCI bus. (like the link you pointed on arm site).
> >
> > This would help this series to progress faster without getting distracted on PCI side.
> 
> Agree the example of virtio-msg over PCI made the discussion divert a bit.
> 
> Maybe focusing on use cases like:
> - FF-A
> - messaging unit + shared memory
> - hypervisor based events + shared memory
> 
> 
> Would make the discussion focus more.
> 
> Cheers
> Bertrand
> 
>

indeed, possible. but do include ff-a bit for reference then.
even if down the road it is not part of the spec (though no idea why
and I would like to see).

-- 
MST 

