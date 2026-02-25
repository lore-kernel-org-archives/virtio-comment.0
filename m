Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042BB393DE3
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 15:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772033000; cv=none; b=N9MYg/qWJdR3KY51E/S4Nuo3zKnZIfD8G6o79xRHMxQyNqGUuaeLZALaepA+hnURi5iRMHm6+eFm/R90KZcl+nhna6QnpJ81qU8c2+09DQ6M9xMpX4ERN8J2apf2WihOvKNCrKGWzac9SgrmAfRkroRCagqyv8fuVjW1rm4J0AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772033000; c=relaxed/simple;
	bh=1LgaHmwMpxVXidTZ0j1Mc6eEaX40AVNCMbMHquOXj+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iq69S7nwCoPHcO4lpdvrrGDSszi5uyfTbS6FneyShPWKRBz/2uh1qH89VGc5IY8jrEiYDmNsJf8NDSFuB8sxtGQwfAIMI3mlnEt7YUYla5/mDQdPBQdTUFTgHiDmRVr1DUIuuqb4w0wywfypDW29iIBnZ3JqmXggidgj3ShV1ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KkUQk95D; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KkUQk95D"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-798617c0ad5so11709907b3.1
        for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 07:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772032998; x=1772637798; darn=lists.linux.dev;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1LgaHmwMpxVXidTZ0j1Mc6eEaX40AVNCMbMHquOXj+E=;
        b=KkUQk95DMbjI9X29yD6ZVKqKA+pbefEwbICjEYgk1a9Ypep3uN4kc5k8HGUyve2ri1
         TMiPtz5yGlqK5Ns9gQEC1mF4Q0wxx2TM0OYNAMd3FhFKGoyyXSQd27EKTVuVZo4TU7DB
         v/2doFNU1yzUKsrO40G33f38oGHyHkjGfVSjfOpKcM+oCHOMTJRwzZm6odXkhlR+yxLW
         +RwU1XVNCw0gpl9sPuUXvWNLj96GMb4PWyaGuln74k4woMMXFz+7wzxh59XfO7p1u3uw
         mb3oE9YY33CDAgZ5HOBDd2Kju+YlrIiwtTTfYvPEU6Ib8r8IVrgvAde0dzNjYFrzstOW
         hIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032998; x=1772637798;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1LgaHmwMpxVXidTZ0j1Mc6eEaX40AVNCMbMHquOXj+E=;
        b=lERmA5dZ0xapZSBxm0JxKbJJyr4uameRyyzTxljy1yOm1Wzz49E8d+67iCxZBekD5M
         CdVtii6ZyIHCtqpjeK9kf2tInQ33GTRW3mQ5VJDHXOfR7j6E7Y7AHnc4bNwjD7AIpFZO
         JE+EN6hMAJry4BWsaJYksJNQhKoCJBd6biUeDoY6BQB2UkPgp9jqVbleB5yqI10hcbxT
         rIinqzAvccRsFydjWgEcB+OKChWvuEmifC4lVSJVpXnTjdOCsoVw/MXjhZeULF0vw5lT
         iEI69iXG7pQZRvkj7Z+74ehBW2NK9gNm2SLO8B1mv/jI+2Ce21ZY6fDXTNc4fnn2P/3Z
         YMlw==
X-Forwarded-Encrypted: i=1; AJvYcCWhsUbG3dwHxmctiHAlACgbtTGxuEb54WPH/O25yudMEl9fNQ0/jURRruKnzG31qMQT9Wu+gH5d4kyfGOkOyg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwA5b8oKvpEAGn2llJbr5Bry5l0mJ6OVoB84cxUfOg7RIbzRTxz
	gYv45HVrgT00JwSQ2ap9/Q57+POHkiaIlRE4NFUTbmJipamSiYcqwB3h
X-Gm-Gg: ATEYQzwgD+rLgm8ZUntPB8++pLAueHNew8Dzea7Cy6AJVMOimRbtDvwKxhUv7htVty0
	jdolwRs5V5yBtH29GQdeiezrkNhI/ep07PRfLNYbGJft3yRERZom5L4ceS3QqW+OevHzMcZ8BLT
	ivND8GAtaMbjjsk9y2NRtbUkgVABjqPszMiEW/vXEhEexMPqr9aOIecec4p/sl3nnzjfwW7+wXO
	OXuyvR1sstblhZh0tXDgOhKO9JQjpTHehBOMpfJyDrL1SoFRadMsT7MyIQ4DZDo1hbyVOwKlzRE
	d5hDs/fiuGRUQ64CVatk8cFdypvD+Yuby+88W8PsNRdtImwdT9ElMbHFeLOdmiacwUxFq5UhUwc
	TVk3NcVclhnApV9O87+S1oVj2fc41ydxPK+EY7siR8yeq7ro5h9cc0xNCxaahdbqcUy22S+vkpd
	UVig8oYKnHT8xbU47EkJBQ1dGrBJUTwrz7tU2gxt8+ll1/ELESh11deV/1Gw4N6hA/SS/tVw0rI
	rjC8f5xuGa3uiCNwdavGYnFGITrrP7bHxT3l7KDRA==
X-Received: by 2002:a05:690c:e3e3:b0:794:d3e6:a503 with SMTP id 00721157ae682-7986fc9ff89mr8730687b3.24.1772032997667;
        Wed, 25 Feb 2026 07:23:17 -0800 (PST)
Received: from [10.138.34.110] (h69-131-216-128.cncrtn.broadband.dynamic.tds.net. [69.131.216.128])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7982dbd9fa2sm56795527b3.18.2026.02.25.07.23.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 07:23:16 -0800 (PST)
Message-ID: <0b93d96e-b243-4f15-a9d8-ab1e9bd84931@gmail.com>
Date: Wed, 25 Feb 2026 10:23:12 -0500
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
To: Parav Pandit <parav@nvidia.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
 "Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee
 <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
References: <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260219185034-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806F703CB616D184FCBE5B3DC68A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <C6374491-FCB1-421F-9273-16B9CB954F5B@arm.com>
 <vigplm62id3vzr3fzekbn5io6qcpeqksgxph6jm4f2qzoripkw@sdh7k6ohw63t>
 <359B0C17-9D57-423A-A229-6CEDA19C975A@arm.com>
 <dyiwq5xhqeoaqmzquzzx4wxsptm6uvrnfgspi6vmcaucq6jn4l@6dvya4te4vsj>
 <SJ0PR12MB68068259D212C6AC8B6A5DEADC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <02226901-7670-4AAB-8F55-0B2FB7C0CA49@arm.com>
 <SJ0PR12MB68068FA1D1893B774C5A8A15DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260225094902-mutt-send-email-mst@kernel.org>
 <8B4F5FE2-1F80-43BE-A60B-5C24B69C8B4E@arm.com>
 <SJ0PR12MB680642C4277CBAC888052FDEDC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <SJ0PR12MB680642C4277CBAC888052FDEDC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ToLhAdxxPJNaMnglM51kO0bF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ToLhAdxxPJNaMnglM51kO0bF
Content-Type: multipart/mixed; boundary="------------88ZV28E8RZGgdFZE49ec6ddz";
 protected-headers="v1"
Message-ID: <0b93d96e-b243-4f15-a9d8-ab1e9bd84931@gmail.com>
Date: Wed, 25 Feb 2026 10:23:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
To: Parav Pandit <parav@nvidia.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
 "Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee
 <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
References: <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260219185034-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806F703CB616D184FCBE5B3DC68A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <C6374491-FCB1-421F-9273-16B9CB954F5B@arm.com>
 <vigplm62id3vzr3fzekbn5io6qcpeqksgxph6jm4f2qzoripkw@sdh7k6ohw63t>
 <359B0C17-9D57-423A-A229-6CEDA19C975A@arm.com>
 <dyiwq5xhqeoaqmzquzzx4wxsptm6uvrnfgspi6vmcaucq6jn4l@6dvya4te4vsj>
 <SJ0PR12MB68068259D212C6AC8B6A5DEADC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <02226901-7670-4AAB-8F55-0B2FB7C0CA49@arm.com>
 <SJ0PR12MB68068FA1D1893B774C5A8A15DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260225094902-mutt-send-email-mst@kernel.org>
 <8B4F5FE2-1F80-43BE-A60B-5C24B69C8B4E@arm.com>
 <SJ0PR12MB680642C4277CBAC888052FDEDC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <SJ0PR12MB680642C4277CBAC888052FDEDC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>

--------------88ZV28E8RZGgdFZE49ec6ddz
Content-Type: multipart/mixed; boundary="------------2ibbVZBLTBUzLEXHHD10el83"

--------------2ibbVZBLTBUzLEXHHD10el83
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2/25/26 10:00, Parav Pandit wrote:
>=20
>> From: Bertrand Marquis <Bertrand.Marquis@arm.com>
>> Sent: 25 February 2026 08:24 PM
>>
>> Hi,
>>
>>> On 25 Feb 2026, at 15:49, Michael S. Tsirkin <mst@redhat.com> wrote:
>>>
>>> On Wed, Feb 25, 2026 at 02:45:35PM +0000, Parav Pandit wrote:
>>>>
>>>>> From: Bertrand Marquis <Bertrand.Marquis@arm.com>
>>>>> Sent: 25 February 2026 04:06 PM
>>>>>
>>>>> Hi Parav,
>>>>>
>>>>>> On 25 Feb 2026, at 11:24, Parav Pandit <parav@nvidia.com> wrote:
>>>>>>
>>>>>>>
>>>>>>> From: Manivannan Sadhasivam <mani@kernel.org>
>>>>>>> Sent: 25 February 2026 03:37 PM
>>>>>>>
>>>>>>> On Wed, Feb 25, 2026 at 08:03:48AM +0000, Bertrand Marquis wrote:=

>>>>>>>> Hi Manivannan,
>>>>>>>>
>>>>>>>>> On 25 Feb 2026, at 08:45, Manivannan Sadhasivam <mani@kernel.or=
g> wrote:
>>>>>>>>>
>>>>>>>>> Hi Bertrand,
>>>>>>>>>
>>>>>>>>> On Fri, Feb 20, 2026 at 09:02:12AM +0000, Bertrand Marquis wrot=
e:
>>>>>>>>>> Hi Parav,
>>>>>>>>>>
>>>>>>>>>>> On 20 Feb 2026, at 07:13, Parav Pandit <parav@nvidia.com> wro=
te:
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>>>>>>>>>> Sent: 20 February 2026 05:25 AM
>>>>>>>>>>>>
>>>>>>>>>>>> On Fri, Feb 13, 2026 at 01:52:06PM +0000, Parav Pandit wrote=
:
>>>>>>>>>>>>> Hi Bill,
>>>>>>>>>>>>>
>>>>>>>>>>>>>> From: Bill Mills <bill.mills@linaro.org>
>>>>>>>>>>>>>> Sent: 26 January 2026 10:02 PM
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> This series adds the virtio-msg transport layer.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> The individuals and organizations involved in this effort =
have had difficulty in
>>>>>>>>>>>>>> using the existing virtio-transports in various situations=
 and desire to add one
>>>>>>>>>>>>>> more transport that performs its transport layer operation=
s by sending and
>>>>>>>>>>>>>> receiving messages.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Implementations of virtio-msg will normally be done in mul=
tiple layers:
>>>>>>>>>>>>>> * common / device level
>>>>>>>>>>>>>> * bus level
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> The common / device level defines the messages exchanged b=
etween the driver
>>>>>>>>>>>>>> and a device. This common part should lead to a common dri=
ver holding most
>>>>>>>>>>>>>> of the virtio specifics and can be shared by all virtio-ms=
g bus implementations.
>>>>>>>>>>>>>> The kernel implementation in [3] shows this separation. As=
 with other transport
>>>>>>>>>>>>>> layers, virtio-msg should not require modifications to exi=
sting virtio device
>>>>>>>>>>>>>> implementations (virtio-net, virtio-blk etc). The common /=
 device level is the
>>>>>>>>>>>>>> main focus of this version of the patch series.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> The virtio-msg bus level implements the normal things a bu=
s defines
>>>>>>>>>>>>>> (enumeration, dma operations, etc) but also implements the=
 message send and
>>>>>>>>>>>>>> receive operations. A number of bus implementations are en=
visioned,
>>>>>>>>>>>>>> some of which will be reusable and general purpose. Other =
bus implementations
>>>>>>>>>>>>>> might be unique to a given situation, for example only use=
d by a PCIe card
>>>>>>>>>>>>>> and its driver.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> The standard bus messages are an effort to avoid different=
 bus implementations
>>>>>>>>>>>>>> doing the same thing in different ways for no good reason.=
 However the
>>>>>>>>>>>>>> different environments will require different things. Inst=
ead of trying to
>>>>>>>>>>>>>> anticipate all needs and provide something very abstract, =
we think
>>>>>>>>>>>>>> implementation specific messages will be needed at the bus=
 level. Over time,
>>>>>>>>>>>>>> if we see similar messages across multiple bus implementat=
ions, we will move to
>>>>>>>>>>>>>> standardize a bus level message for that.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> I would review more, had first round of sparse review.
>>>>>>>>>>>>> Please find few comments/questions below.
>>>>>>>>>>>>
>>>>>>>>>>>> I'd like to comment that I think it makes sense to have a ba=
sic simple transport and
>>>>>>>>>>>> then add performance features on top as appropriate.
>>>>>>>>>>> Sounds good. Simple but complete is needed.
>>>>>>>>>>
>>>>>>>>>> Agree.
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>> So one way to address some of these comments is to show how
>>>>>>>>>>>> they can be addressed with a feature bit down the road.
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>> 1. device number should be 32-bit in struct virtio_msg_head=
er.
>>>>>>>>>>>>>> From SIOV_R2 experiences, we learnt that some uses have us=
e case for more than 64k devices.
>>>>>>>>>>>>> Also mapping PCI BDF wont be enough in 16-bits considering =
domain field.
>>>>>>>>>>>>>
>>>>>>>>>>>>> 2. msg_size of 16-bits for 64KB-8 bytes is too less for dat=
a transfer.
>>>>>>>>>>>>> For example, a TCP stream wants to send 64KB of data + payl=
oad, needs more than 64KB data.
>>>>>>>>>>>>> Needs 32-bits.
>>>>>>>>>>>>>
>>>>>>>>>>>>> 3. BUS_MSG_EVENT_DEVICE to have symmetric name as ADDED and=
 REMOVED (instead of READY)
>>>>>>>>>>>>> But more below.
>>>>>>>>>>>>>
>>>>>>>>>>>>> 4. I dont find the transport messages to read and write to =
the driver memory supplied in VIRTIO_MSG_SET_VQUEUE addresses
>> to
>>>>>>> operate
>>>>>>>>>>>> the virtqueues.
>>>>>>>>>>>>> Dont we need VIRTIO_MEM_READ, VIRTIO_MEM_WRITE request and =
response?
>>>>>>>>>>>>
>>>>>>>>>>>> surely this can be an optional transport feature bit.
>>>>>>>>>>>>
>>>>>>>>>>> How is this optional?
>>>>>>>>>>
>>>>>>>>>> As said in a previous mail, we have messages already for that.=

>>>>>>>>>> Please confirm if that answer your question.
>>>>>>>>>>
>>>>>>>>>>> How can one implement a transport without defining the basic =
data transfer semantics?
>>>>>>>>>>
>>>>>>>>>> We did a lot of experiments and we are feature equivalent to P=
CI, MMIO or Channel I/O.
>>>>>>>>>> If anything is missing, we are more than happy to discuss it a=
nd solve the issue.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> I'd love to have this transport over PCI because it addresses t=
he shortcomings
>>>>>>>>> of the existing PCI transport which just assumes that every con=
fig space access\
>>>>>>>>> is trap and emulate.
>>>>>>>>
>>>>>>>> Agree and AMD did exactly that in their demonstrator.
>>>>>>>> I will give you answers here as i know them but Edgar will proba=
bly give you more
>>>>>>>> details (and probably fix my mistakes).
>>>>>>>>
>>>>>>>>>
>>>>>>>>> But that being said, I somewhat agree with Parav that we should=
 define the bus
>>>>>>>>> implementations in the spec to avoid fixing the ABI in the impl=
ementations. For
>>>>>>>>> instance, if we try to use this transport over PCI, we've got q=
uestions like:
>>>>>>>>>
>>>>>>>>> 1. How the device should be bind to the virtio-msg-pci bus driv=
er and not with
>>>>>>>>> the existing virtio-pci driver? Should it use a new Vendor ID o=
r Sub-IDs?
>>>>>>>>
>>>>>>>> One bus is appearing as one pci device with its own Vendor ID,
>>>>>>>>
>>>>>>>
>>>>>>> What should be the 'own Vendor ID' here?
>>>>>>>
>>>>>>> The existing virtio-pci driver binds to all devices with the Vend=
or ID of
>>>>>>> PCI_VENDOR_ID_REDHAT_QUMRANET. So are you expecting the Vendors t=
o use their own
>>>>>>> VID for exposing the Virtio devices? That would mean, the drivers=
 on the host
>>>>>>> need update as well, which will not scale.
>>>>>>>
>>>>>>> It would be good if the existing virtio-pci devices can use this =
new transport
>>>>>>> with only device side modifications.
>>>>>>>
>>>>>>>>>
>>>>>>>>> 2. How the Virtio messages should be transferred? Is it through=
 endpoint config
>>>>>>>>> space or through some other means?
>>>>>>>>
>>>>>>>> The virtio messages are transfered using FIFOs stored in the BAR=
 of the PCI
>>>>>>>> device (ending up being memory shared between both sides)
>>>>>>>>
>>>>>>>
>>>>>>> What should be the BAR number and size?
>>>>>>>
>>>>>>>>>
>>>>>>>>> 3. How the notification be delivered from the device to the hos=
t? Through
>>>>>>>>> INT-X/MSI/MSI-X or even polling?
>>>>>>>>
>>>>>>>> Notifications are delivered through MSI.
>>>>>>>>
>>>>>>>
>>>>>>> So no INT-X or MSI-X? Why so?
>>>>>>>
>>>>>>> Anyhow, my objective is not to get answers for my above questions=
 here in this
>>>>>>> thread, but to state the reality that it would be hard for us to =
make use of
>>>>>>> this new transport without defining the bus implementation.
>>>>>>>
>>>>>> +1 to most of the points that Manivannan explained.
>>>>>>
>>>>>> The whole new definition of message layer for the PCI does not mak=
e any sense at all where expectation for the device is to build yet
>>>>> another interface for _Everything_ that already exists.
>>>>>> and device is still have to implement all the existing things beca=
use the device does not know which driver will operate.
>>>>>>
>>>>>> And that too some register based inefficient interface.
>>>>>> Just to reset the device one needs to fully setup the new message =
interface but device still have to be working.
>>>>>> That defeats the whole purpose of reset_1 and reset_2 in the devic=
e.
>>>>>>
>>>>>> This does not bring anything better for the PCI devices at all.
>>>>>>
>>>>>> A transport binding should be defined for the bus binding.
>>>>>> A bus that chooses a msg interface should be listed that way and b=
us choose inline messages can continue the way they are.
>>>>>>
>>>>>> If we are creating something brand-new, for PCI the only thing nee=
ded is:
>>>>>> 1. Reset the device
>>>>>> 2. Create an admin virtqueue
>>>>>> 3. Transport everything needed through this virtqueue including fe=
atures, configs, control.
>>>>>>
>>>>>> And this will work for any other bus or msg based too given only c=
ontract needed is to creating the aq.
>>>>>
>>>>> I think you misunderstood a bit the point of virtio-msg bus over PC=
I so let me try to explain.
>>>>>
>>>>> You see one PCI device (regular, not virtio) which is a "virtio-msg=
 bus over PCI".
>>>>>
>>>>> When the virtio-msg bus over PCI it will communicate through this d=
evice with an external
>>>>> system connected through the PCI bus.
>>>>> The driver will enumerate virtio devices available behind this bus =
and register them so that
>>>>> the corresponding virtio drivers are probed for them.
>>>>> All virtio-msg messages required to communicate with those devices =
will be transferred through
>>>>> a FIFO stored in the BAR of the pci device and standard PCI DMA wil=
l be used to share the
>>>>> virtqueues with all the devices on the bus.
>>>>>
>>>>> So the PCI device is not one virtio device but one bus behind which=
 there can be many devices.
>>>>>
>>>>> Is this making the concept a bit clearer ?
>>>>>
>>>> Yes. This makes a lot of sense now.
>>>>
>>>> This is a virtio-msg-transport device that needs its own device id i=
n the table.
>>>> And its binding to the PCI transport.
>>>
>>> ok. how about an rfc of that idea on the list?
>>
>>
>> I will let Edgar answer on this.
>>
> Sure.
> Also please explain how is this different than SR-IOV devices?
> On a PCI device there are some child devices exposed using some virtio-=
msg bus transport.
> And all of them are going to share same PCI BDF.
> These individual devices cannot be mapped to different VMs (secure or r=
egular) in a performant way either.
> So what would this virtio-msg-transport device achieve?

Since the message transport is more peer-to-peer, would it make
sense to use this to allow VMs to implement virtio devices for use
by other VMs?
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
--------------2ibbVZBLTBUzLEXHHD10el83
Content-Type: application/pgp-keys; name="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBFp+A0oBEADffj6anl9/BHhUSxGTICeVl2tob7hPDdhHNgPR4C8xlYt5q49y
B+l2nipdaq+4Gk6FZfqC825TKl7eRpUjMriwle4r3R0ydSIGcy4M6eb0IcxmuPYf
bWpr/si88QKgyGSVZ7GeNW1UnzTdhYHuFlk8dBSmB1fzhEYEk0RcJqg4AKoq6/3/
UorR+FaSuVwT7rqzGrTlscnTDlPWgRzrQ3jssesI7sZLm82E3pJSgaUoCdCOlL7M
MPCJwI8JpPlBedRpe9tfVyfu3euTPLPxwcV3L/cfWPGSL4PofBtB8NUU6QwYiQ9H
zx4xOyn67zW73/G0Q2vPPRst8LBDqlxLjbtx/WLR6h3nBc3eyuZ+q62HS1pJ5EvU
T1vjyJ1ySrqtUXWQ4XlZyoEFUfpJxJoN0A9HCxmHGVckzTRl5FMWo8TCniHynNXs
BtDQbabt7aNEOaAJdE7to0AH3T/Bvwzcp0ZJtBk0EM6YeMLtotUut7h2Bkg1b//r
6bTBswMBXVJ5H44Qf0+eKeUg7whSC9qpYOzzrm7+0r9F5u3qF8ZTx55TJc2g656C
9a1P1MYVysLvkLvS4H+crmxA/i08Tc1h+x9RRvqba4lSzZ6/Tmt60DPM5Sc4R0nS
m9BBff0Nm0bSNRS8InXdO1Aq3362QKX2NOwcL5YaStwODNyZUqF7izjK4QARAQAB
zTxEZW1pIE9iZW5vdXIgKElUTCBFbWFpbCBLZXkpIDxhdGhlbmFAaW52aXNpYmxl
dGhpbmdzbGFiLmNvbT7CwY4EEwEIADgWIQR2h02fEza6IlkHHHGyiLVf/5wiwQUC
X6YJvQIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRCyiLVf/5wiwWRhD/0Y
R+YYC5Kduv/2LBgQJIygMsFiRHbR4+tWXuTFqgrxxFSlMktZ6gQrQCWe38WnOXkB
oY6n/5lSJdfnuGd2UagZ/9dkaGMUkqt+5WshLFly4BnP7pSsWReKgMP7etRTwn3S
zk1OwFx2lzY1EnnconPLfPBc6rWG2moA6l0WX+3WNR1B1ndqpl2hPSjT2jUCBWDV
rGOUSX7r5f1WgtBeNYnEXPBCUUM51pFGESmfHIXQrqFDA7nBNiIVFDJTmQzuEqIy
Jl67pKNgooij5mKzRhFKHfjLRAH4mmWZlB9UjDStAfFBAoDFHwd1HL5VQCNQdqEc
/9lZDApqWuCPadZN+pGouqLysesIYsNxUhJ7dtWOWHl0vs7/3qkWmWun/2uOJMQh
ra2u8nA9g91FbOobWqjrDd6x3ZJoGQf4zLqjmn/P514gb697788e573WN/MpQ5XI
Fl7aM2d6/GJiq6LC9T2gSUW4rbPBiqOCeiUx7Kd/sVm41p9TOA7fEG4bYddCfDsN
xaQJH6VRK3NOuBUGeL+iQEVF5Xs6Yp+U+jwvv2M5Lel3EqAYo5xXTx4ls0xaxDCu
fudcAh8CMMqx3fguSb7Mi31WlnZpk0fDuWQVNKyDP7lYpwc4nCCGNKCj622ZSocH
AcQmX28L8pJdLYacv9pU3jPy4fHcQYvmTavTqowGnM08RGVtaSBNYXJpZSBPYmVu
b3VyIChsb3ZlciBvZiBjb2RpbmcpIDxkZW1pb2Jlbm91ckBnbWFpbC5jb20+wsF4
BBMBAgAiBQJafgNKAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRCyiLVf
/5wiwYa/EACv8a2+MMou9cSCNoZBQaU+fTmyzft9hUE+0d5W2UY1RY3OsjFIzm9R
/4SVccfsqOYLEo+S0vQMIIIqFEq3FCpXXwPzyimotps05VA8U3Bd7yseojFygOgK
sAMOAee2RCaDDOnoJue01dfZMzzHPO/TVdp3OvnpWipfv5G1Xg96rwbhMLE3tg6N
xwAHa31Bv4/Xq8CJOoIWvx6fcmZQpz01/lSvsYn0KrfEbTKkuUf0vM9JrCTCP2oz
VNN5BYzqaq2M4r+jmSyeXLim922VOWqGkUEQ85BSEemqrRS06IU6NtEMsF8EWt/b
hWjk/9GDKTcnpdJHTrMxTspExBiNrvpI2t+YPU5B/dJJAUxvmhFrbSIbdB8umBZs
I3AMYrEmpAbh5x7jEjoskUC7uN3o9vpg1oCLS2ePDLtAtyBtbHnkA4xGD7ar8mem
xpH9lY/i+sC6CyyIUWcUDnnagKyJP0m9ks0GLsTeOCA0bft2XA6rD6aaCnMUsndT
ctrab42CV5XypjmC4U1rPJ8JQJUh1/3P48/8sMH+3krxpJ06KNWNFaUbaMTGiltZ
7x9DngklSYrX0T+2G4kVXNmjaljwkoLahwLla2gUWwBSyofXdqyhQdwZsp01KXNQ
UCyT/Pg+aDcm/E7OMV3d4lf7g/CSxiX2GSEe6BlhSz+Lmd7ZJ3g32M1ARGVtaSBN
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
EtJuZYM5blWncBOJCoWMnBEcTEo/viU3GgcVRw=3D=3D
=3Dx94R
-----END PGP PUBLIC KEY BLOCK-----

--------------2ibbVZBLTBUzLEXHHD10el83--

--------------88ZV28E8RZGgdFZE49ec6ddz--

--------------ToLhAdxxPJNaMnglM51kO0bF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmmfE+AACgkQszaHOrMp
8lOHcBAAjRAMpf3VNCLOTIo9SVWwATK3PpkbII5ji+bFQEvysdoYxkQYMm2PzQwk
fqACtFwnkNYh0ZEpkXV/1V/JAwNpi+lF9osRdj80JD0tTtjGW4AzVDhdKFeIoGcN
h/y4KYKevIGXs1oxDg7tvAGnPaS+eN6TNmT9SXKbkKO+eAUs05rxCnkWuHTFPZep
JlVIjmckAevU1ZR9+P83KwmQHZ+htrTL8DFMvtETi/hKxTFxRn1vpRjN8L3tm9bd
lqJ4qwZnnpYwmyeAQJEho1XjgYKWW9jcbZVNexNqrEIrGzK678GtFY1XFjAbPk4s
bxGd+wEohhOnF23+C1xxPXVKUQE6muQHgaOYzKIy8oj0bkmnHMkwo8rJ9K+kwCUI
gtM26wI409n+v1H4foLELsN+8m5d0M9s6nSZs/SGt3cqb2+vKyceY+d6puFpKfgq
zuCD9Sr0EAZvOphevLKfffyGQIDmCQlDvTTlM1JVNoxzGSkLBffOih+wffZlBXZC
cZlZMDB32vDVAndguBuPLEazCVTgDTIkAflA6Nli9vl2FOvz/4aPCBjnZ2WzXrsG
kxsDGdtIp0Vjuu65W2RyJcZYV3pe42U+suOiWRNkjUJto9m+5xHrYGQsR+hs9im3
f24rMrhqy1/57n2DsH8emrOeoBYAwE4my5TucHHKW6ndyLSLP80=
=pDHM
-----END PGP SIGNATURE-----

--------------ToLhAdxxPJNaMnglM51kO0bF--
