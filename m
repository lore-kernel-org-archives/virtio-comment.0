Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A617D15EFC1
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 11:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720696054; cv=none; b=jH+/crjzUPym1i1flY2raerI20ECNvMzSNwT/xNTFXlyGTP9Q2Eo+Kiih808m+kOZthk7eEMhUpGqQ+XI+EyCWiBKLOywokU9Lxdrhi8aLEpid+14zCmasEA3WpC5uV6Ro0LSFEIfO7jLtfizyt1T3g5IPfYwozJXcs5qKIZM1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720696054; c=relaxed/simple;
	bh=D+Xfy8CnVI8JlYrJKkrclTW9nsu5BBU+1iAZEqC3VPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=eFr9ddjb2Dk/a3xUP82c9m9Yh3RAnxZLX2C8OxoHjDQtqBV1tG4nmcP3X4P+SnvBN+i4t2LxcKJPbnvpQIr3dyAFjl+raNhX4SkgwrQxeNn9ZaJDnkrN9wZQdxQJ/n8wbppYPGxDiaOPHOjxUPfgrEy8h/Itfx9bMdKsApRZQCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eGsjGbMj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eGsjGbMj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720696051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bxm6ZwBQNttE6NXH2tH+hOG8L+M651n16Czz/3zeXsM=;
	b=eGsjGbMj8Gx1lXF/tYW9BPHlXVIR3WJzBTYmdFAuU4XdxKqIQwnD1H0i6zfVlHekHl+pKL
	ARdBmRjg7ADmLV/pAfkKm2U6JhTMYP7B9z170OhXViSKyS483IfBc6bhkjv/cvBbvLU42F
	L8OCBCP+VhQanEMMcCAInODBn8UBTX4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-FCzyiksyNuqsDrkt0sNM1A-1; Thu, 11 Jul 2024 07:07:30 -0400
X-MC-Unique: FCzyiksyNuqsDrkt0sNM1A-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-36795e2ce86so500662f8f.0
        for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 04:07:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720696049; x=1721300849;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxm6ZwBQNttE6NXH2tH+hOG8L+M651n16Czz/3zeXsM=;
        b=A/AE/GZm/Jw8zmmUVvSS+oVsqBd59rNI+LOPDIGyYIRZnLLVCql8tPJpcVaGSJNsTx
         0ofcOCvr+XpcstcyJK5d6YwfMEsbdpSjvx4i8xyegBiUWN0pUjjRIBZVsNn9JaUMEFjG
         q7y+ri01eeh2dqy/QD6gaX07DyReVWa5pGnP7UNmPMLpC0vjl31wpbaGQBszVpQ2zx90
         wZp+bUiNyluwDDI4CFxgsDZGOeHWavP95y5wWiFARQVigRWuk0OUSMjbITc+/pdWF6dQ
         kCckNrj3lbEatclAAHotE5DKpgGG5afgu9ZLonwQr9id7lGbN/xxkPosPdSjUhi0L+Wg
         sysg==
X-Forwarded-Encrypted: i=1; AJvYcCU/EsGLjXf/PakcybWT0pOwQi+XsEYFRUY4aoIzsEpHfdgyqweK9cVcISwv8ZShDIK3hrolrQiHwMHq6RTIetwD718bb5G2i7OJUTNr4QE=
X-Gm-Message-State: AOJu0Yw4+Z2mQUHfd2LY+InsJe+jiIil1vI5Ci9NhpZF/cyQqB1X59OW
	ci8Ot6+J2sIVBYgtzOTOL6vjZ3TtC9srbCMmeSgZULVYyfJVkgF51VxiB0/ywM9URbXAYfpThcn
	+cwfO7LWPAoxpFLSn+sT2l2QYMh1XTNHxs3CWHhYAGiF4BfrN+pWWV1387AnQN4gv
X-Received: by 2002:a5d:58da:0:b0:367:35d7:bf11 with SMTP id ffacd0b85a97d-367cea736aemr5779341f8f.25.1720696048923;
        Thu, 11 Jul 2024 04:07:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEekxElAzHR3it/UbXP7N//NMR+NEsxqJkVL7D4UWZG/wk89We0rjSJ7skIyiUXagln9HOQDg==
X-Received: by 2002:a5d:58da:0:b0:367:35d7:bf11 with SMTP id ffacd0b85a97d-367cea736aemr5779324f8f.25.1720696048324;
        Thu, 11 Jul 2024 04:07:28 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:341:761e:f82:fc9a:623b:3fd1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfa0666sm7458378f8f.73.2024.07.11.04.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 04:07:27 -0700 (PDT)
Date: Thu, 11 Jul 2024 07:07:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Stefano Garzarella <sgarzare@redhat.com>,
	virtio-comment@lists.linux.dev,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: Re: [PATCH V7] virtio-transport: Add a new section to clarify
 transport requirements
Message-ID: <20240711070635-mutt-send-email-mst@kernel.org>
References: <279db14c105666b4e2c9c71dede31592947dd9f5.1720683975.git.viresh.kumar@linaro.org>
 <zzzc2nvseptvarhpwv5vckka5yvtptgebufw3ll4oe2yascfek@5so5pdt4ur7w>
 <20240711092332.uf5n4sbzke52tf52@vireshk-i7>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240711092332.uf5n4sbzke52tf52@vireshk-i7>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 11, 2024 at 02:53:32PM +0530, Viresh Kumar wrote:
> On 11-07-24, 10:41, Stefano Garzarella wrote:
> > On Thu, Jul 11, 2024 at 01:18:18PM GMT, Viresh Kumar wrote:
> > > +A transport provides a mechanism for the driver to discover the device.
> > 
> > I agree that this would be desirable, but for example IIUC the MMIO
> > transport does not provide this, in fact we have to specify to the kernel
> > the address where to find the devices.
> > 
> > Should we put it more as something desirable but not required?
> 
> What about:
> 
> A transport may provide a mechanism for the driver to discover the device.
> 
> But I thought I am required to remove all occurrences of
> should/must/may and use direct speech. Maybe "may" is still fine ? :)

Nope, but "can" is fine.
You are not supposed to just mechanically remove text, rephrase so
it still makes sense.

> > Having said that I don't know whether to use different words or split
> > "Transport Requirements" into 2 sub sections "Required Requirements" and
> > "Optional Requirements".
> 
> -- 
> viresh

