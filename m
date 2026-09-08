Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D075592E8
	for <virtio-comment@lists.linux.dev>; Tue,  8 Sep 2026 14:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788877004; cv=none; b=pIWWdAN6IMjHiFhTDn7Td4PUf9jUXkhvbErg9imbI1GGJYeGFvt2P+lyWXRiRdaGP0JwhKU2NCb5wRnYub+RdSzMhgIQYqbGMkI8wteGDi7LvoTb5gD/1OiI8zES3oFlJGaomg9C/qnm3d1a93zJntdPF6SDVqGBpDSPk/PFAWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788877004; c=relaxed/simple;
	bh=RV8TdANwL/5EutKA/AUe6lj+I0Jns+VW5Jss/fK9vh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=hWNLtD5KOaExmgO2IZKfQT8SxQ7VzSe/nLKtpqJgnzlpF0McuFtphMtKb8ArGdbSNxZ9Wqxl4f3p8HNKo+bsRf+wdq2qD9LrlUls6+ColeuDGbGEeVyKwC6MMtXIsU5sO23X9T5fV6o5YTxscs+Sn28/CYmSIYScswqmqErohKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RqDlD1lF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RqDlD1lF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788876995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qnV1tzizq4SCDj/N21ieWJnomUAwLmO7lP61dtUMmYg=;
	b=RqDlD1lFqVcTHENP7nqziPkXJjwlcmbky9q7jf3LiN7Fo2uJbIvco26QGotJHS0pUj/nTB
	7WJpV4kYgDuShSajO6qlU3hoFJBBI0Woqx7XYWLzaBQQPp2hdUXi0zgDdBLDBvO304y3pp
	ECOKyA3GmQVoH0GnFXgfz0DillDyex4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-miizAKgvOJ-BBcrYs1RhcQ-1; Tue, 08 Sep 2026 10:16:30 -0400
X-MC-Unique: miizAKgvOJ-BBcrYs1RhcQ-1
X-Mimecast-MFC-AGG-ID: miizAKgvOJ-BBcrYs1RhcQ_1788876984
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-484337a63bbso2909448f8f.3
        for <virtio-comment@lists.linux.dev>; Tue, 08 Sep 2026 07:16:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788876984; x=1789481784;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qnV1tzizq4SCDj/N21ieWJnomUAwLmO7lP61dtUMmYg=;
        b=Q/Yt19sOAR8UapLqGRp0jq0LuXSsyobHsp7pK5AUNMrjzKRnNSQhFZaASA/N3sYz5e
         oG1F2BhdVFwRpkGu3Fe8yR+A+K8TRAxqVcf5/IRixPiOZpaEUlf/qvdGbpkYDmkSwOwI
         Lu3bL8OHb4zvZBM8Cm2yH+433I/3hW9FLAEkViRH342Q2CtLpp1QaLN0norJF9Kf+r/t
         I7bBT9jVDnJwlbVmsPpw1L1hEkiD/cuEKHQEVVKrcAIxE0rqsaSPZCuVyg3Gci01+aJd
         evXlNOb8URCV8m0pSFIZUSO5tSMjn1kUiXUHMucIkEzqYHpTLcAEJJgkdEkFGj1eCHxv
         VXpQ==
X-Gm-Message-State: AFuF++n/X4KENRlh1iqJw4S2e/fE+0AOAfXSCA18zfWCk0ku1oVBSgNx
	gk3x++yqt5oCR0V/jTP1O3fR5f2am0TeZT6ioM5UMjcpN9H8DQEs/2bsrOZ4YvsXfOJkKY9uzDC
	JxuBl30coh5C8JKV87sL9caB9TBXns0Ec8+WK+47Xxafh2ODNNPUbMeaiejMB8+wJ3xFx
X-Gm-Gg: AYBFou34ZbKo6Re/42TYN4zjZjwKlQzDLANfLlzWtvV+/Yo7pU6yayGK8a8+Jbnwp6X
	57yUc/QUySfcK4dTxZUHKulyovnfvA0paZ0pzeKFwqz39Z06vNdTTuBXhfH+5C7IC4oiugH7B/7
	NK0iwj0iWEOGv+Saa/dsXCI6pNg014eFS3OV8ETCg1rUi4JYR7DyDtpwL0pFiR5IZ4hzyU6untS
	1XruuYEe2dyNVDTIR7wB3Eql9d5U1RocNn2Gwm2NhdMaab/mypa5obWZNpcmR0njmZgca4LCYcE
	DWII7L/IE54NFuVHyrjoKPOrmzbT1l4BjQPbHlGXcWPrpdyK6FrqqlgQ60KvO4SImBwravq8Xs+
	NNxcPPTpBcIGtH0der911iJc=
X-Received: by 2002:a5d:5c82:0:b0:485:8a46:b3b5 with SMTP id ffacd0b85a97d-4858a46b479mr28347483f8f.29.1788876983842;
        Tue, 08 Sep 2026 07:16:23 -0700 (PDT)
X-Received: by 2002:a5d:5c82:0:b0:485:8a46:b3b5 with SMTP id ffacd0b85a97d-4858a46b479mr28347394f8f.29.1788876983225;
        Tue, 08 Sep 2026 07:16:23 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9234sm36332907f8f.14.2026.09.08.07.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:16:22 -0700 (PDT)
Date: Tue, 8 Sep 2026 10:16:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH v3 1/1] device-types/blk/description.tex: Allow longer
 device IDs to be returned
Message-ID: <20260908095347-mutt-send-email-mst@kernel.org>
References: <20260908094050.915173-1-rjones@redhat.com>
 <20260908094050.915173-2-rjones@redhat.com>
 <20260908060804-mutt-send-email-mst@kernel.org>
 <20260908115108.GV1436@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260908115108.GV1436@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nCVO_M10AxjpgmQxgVtRT8mcJika2oHbcEKP_vuu8K0_1788876984
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 08, 2026 at 12:51:08PM +0100, Richard W.M. Jones wrote:
> On Tue, Sep 08, 2026 at 06:57:08AM -0400, Michael S. Tsirkin wrote:
> > Thanks for the patch! Yes something to improve:
> > 
> > On Tue, Sep 08, 2026 at 10:40:50AM +0100, Richard W.M. Jones wrote:
> > >  VIRTIO_BLK_T_GET_ID requests fetch the device ID string from the device into
> > > -\field{data}.  The device ID string is a NUL-padded ASCII string up to 20 bytes
> > > -long.  If the string is 20 bytes long then there is no NUL terminator.
> > > +\field{data}.  The device ID string is an ASCII string which can be
> > > +up to 247 bytes long.
> > 
> > Judging by the below, it does not have to be ASCII? just a nul
> > terminated string?
> > 
> > 
> > 247 is just a very weird limit.
> > So we get another
> > arbitrary number drivers need to worry about. Ugh.
> > I just don't get all the references
> > to scsi vpd or whatever. It's your motivation I get that
> > but we should not set policy.
> > 
> > Let's just simply limit the string to  255 bytes and
> > make data 255 bytes too?
> 
> I wonder actually if 128 is better.  It fits within the Windows limit
> and it doesn't hurt for Linux either because of NAME_MAX limitations
> that you would encounter with udev.

Up to you. I actually take it back about trying to cut out the
last byte - no driver seems to combine status and data, let's just
make data a power of 2 in size.


> > Then with the status byte the write buffer fits in a 256 pcie packet.
> > 
> > Maybe others feel differently.
> > 
> > > +
> > > +If VIRTIO_BLK_F_LONG_ID was not negotiated, VIRTIO_BLK_T_GET_ID
> > > +fetches the first 20 bytes of the device ID string.  If the ID is
> > > +shorter than 20 bytes, then the response is padded with NUL bytes so
> > > +its length is 20 bytes.  (Note that if the ID is 20 bytes or longer,
> > > +this means the response will not be NUL terminated.)
> > 
> > But the driver can not both negotiate and not negotiate
> > VIRTIO_BLK_F_LONG_ID.
> 
> Interesting .. so I think I misunderstood how feature negotiation
> works.  I _thought_ that the driver sends back features it
> understands, via the features array:
> 
> https://github.com/torvalds/linux/blob/28924df2a08f440c73991b83028032c901de2ae4/drivers/block/virtio_blk.c#L1669
> 
> and therefore the host side can see if the driver supports
> VIRTIO_BLK_F_LONG_ID.  Is that not how it works?

Yes. I am just saying there are drivers with VIRTIO_BLK_F_LONG_ID
that see the long id or without that see short one.
No one checks both so there is no need to constrain how
they are related.

> 
> > So what does this requirement that the two configs share
> > a prefix buy us, practically?
> > 
> > Why don't we just say that the ID is up to either 20 bytes or
> > 255 bytes depending on the feature negotiation?
> 
> We can just drop the "first" language.

I like that.

> > > +
> > > +If VIRTIO_BLK_F_LONG_ID was negotiated, VIRTIO_BLK_T_GET_ID fetches
> > > +the complete device ID string.  The response is always 248 bytes long,
> > > +padded to this length with NUL bytes.  Since the longest permitted
> > > +device ID string is 247 bytes, the response is NUL terminated.
> > 
> > Let's just handle short and long forms consistently please.
> > If the string fills all of data then it is not terminated. end of story.
> > 
> > All the subtle differences are just a source for confusion.  Can we not
> > define something like "maximum ID length" and then use it everywhere,
> > instead of all the duplication?
> 
> Sure.
> 
> > > +
> > > +Although 247 byte device ID strings are allowed, there may be
> > > +interoperability problems if strings longer than 128 bytes are used.
> > 
> > I think you mean 127? so it's 128 with the NUL.
> > 
> > > +It is also advisable to use only 7 bit ASCII characters.
> > 
> > ASCII == 7 bit. Maybe you mean printable characters?
> > 
> > 
> > Pls add both these recommendations in the conformance section.
> 
> OK.
> 
> Rich.
> 
> -- 
> Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
> Read my programming and virtualization blog: http://rwmj.wordpress.com
> nbdkit - Flexible, fast NBD server with plugins
> https://gitlab.com/nbdkit/nbdkit

