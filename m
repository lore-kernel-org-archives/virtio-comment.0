Return-Path: <virtio-comment-return-8459-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C2DC072A2
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 12:11:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3875F2A8D3
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 12:11:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1BCA3986E25
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 12:11:19 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 05F36986E1E; Fri, 17 Nov 2023 12:11:19 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E9722986E1F
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 12:11:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dJOg1cMJw238dEn64BaFuKjnTFWQLIZggHgHgpGavkddm3kucuqr9NdEs8dl6oHwrwhkPNeq52nDtkjgA9GuO5W3KsKusqzszvcEaPFLxP6bboNCSnaTp0I/YjkApt2NmKSz/NvO52HtUDkX9dU3IvYaS5Mt0l2DNNnrqjP3igt4ucQZMcpNFIxFEeCiz8jekY3tAlSMNK6tSOx1xn5UDoskCd1lzebe/vzA90mUp6QRaJJu0+72wEU0yiwC+yXBFCUWJ4glTLzLDaq0df9SBsaAnGptQjupPo2qNs2Rc1uMFCSO1SihDcGa6GKXaC222PiK3i+myo/EKx7OhfNEig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bxdy5NutG/Rl6xqDFNg0FERKPIG5P85hzcwN26/u1ZE=;
 b=F4uMod19WMNaF36mncAtLz0X4w2dE7u5OLSrKK71mGSg+4XkBlpkEHrO5apxITXxLNC2L2K2hiIZrzzK2JmTtdwE8c2HQHJvmZsW9HERe2FUWafRxnwThY+dr2nJpmXNckaLClSqLxZ+ok3LvZ3qIwMqW91CuZBBt1UmIaDkBAQ37s4pDsxbYzhl8Ody9K4DoGuif9tFkeB5gAH4suOS2JPFX822PgzW42ISjwSin046n5gARIJvZfN0gxpVp2w2gDasVrdl/RyEcC3vGZ3sw0mIe5ulbXqBc2nuWKmxg4CSL5RR3jWE877NoAwIBRnm9jKBTAyYMFhALiXQ4BURdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "Zhu, Lingshan" <lingshan.zhu@intel.com>, Jason Wang
	<jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands
Thread-Index:
 AQHaCzPonHREgkZknEiTjfT1JtA3fLBjIMmAgAAcy4CAAWD+gIAAKSfAgAGqygCAABTkAIAGWMEAgAADI2CAAWVPgIACFpEAgAdP4YCAA//WQIAAxB+AgAAJgRCAAA8CgIAATUGAgAAZpoCAAXC2gIAAADIwgAAQrwCAAADWwIAACKCAgAACIJCAAAaJgIAAAShQ
Date: Fri, 17 Nov 2023 12:11:15 +0000
Message-ID:
 <PH0PR12MB5481C905833821171814CB13DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB54815F616E0CF024927984C2DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116004037-mutt-send-email-mst@kernel.org>
 <b0ad9991-4372-4900-8baf-a111777f6d92@intel.com>
 <20231116065416-mutt-send-email-mst@kernel.org>
 <705e728a-368a-4e28-a7b2-61afddb15ce9@intel.com>
 <PH0PR12MB5481C2B37901FDBBE672EF98DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117054650-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813446F8F2BBDBC74BF393DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117063304-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548179702B4F7B460E09681CDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117065740-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231117065740-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BL0PR12MB5506:EE_
x-ms-office365-filtering-correlation-id: deee01bc-c29a-4e98-7a32-08dbe7664c54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 YDdLAlGnGvrIj6xSyVdSMxk5/q4IG+m38IECSV1zY59Z9f7yNyZ/8ObI0aAZpiHM4RQx/YFCjykT8FIp3S1hUFQTd9GRqSlHoAzryCV1U/MGx5Qq5fAs28QAi5KwBjBwdwqRoUEqdeLbSuuavqQOWQXF3GvbcIKshFTWwJ4fK9B/cBzkUNazq6vXSLAusjHNrQy1x7SpU76x5p716U71OB7Umh4BQDVjn1g9WBf73kFR5zfqz6ku7xq6Y8N2KWJyIZ/GGKX/I+EX46aqsMMkE7J367w8LxSa5Ayfgp0Lfs5rY4oEBciAMj3uwSvHIw8c++ztu6t6aqznhhNh4PE0YJqrITPj8iObicpIJeFXTDwtrqPLS5cn3qrR09e7WpiHRfrjuwL8ed0Q+FOk7xKyPRJb/AN49WAiplbq6WpqDMTm0ZCXGcCWHg5PoKBezvX5c/pRDV8NS8/WB9KGuQlRJN8E05286MiDbUyKcfDMuvC7GdebRXEVwcEFKdMfXmOOMneIS6nRvs9XWQP5LWqQJTzHG87H7Yvbjvhzp5W1w5xu6en6CUR2Yl3bUTXxwVETSHLjQmy6rjV/ABgXgzIxIZ6SKMfBJXFBHpQVmcYbWDOSdVQ/u2xRqvBkM59A1tD+iQh+/onlnLMYMmu/tJ+qjEo3eKYWyf/Lkztm9uGzKW6TNagkNEhef+f68roWHs2c
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(39860400002)(346002)(366004)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(107886003)(55016003)(26005)(7696005)(6506007)(4326008)(8676002)(5660300002)(71200400001)(8936002)(76116006)(2906002)(66476007)(66446008)(64756008)(54906003)(33656002)(53546011)(55236004)(86362001)(52536014)(66556008)(66946007)(38100700002)(478600001)(6916009)(316002)(9686003)(966005)(38070700009)(41300700001)(83380400001)(122000001)(69594002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?6qwLhjDg4OJKi50NvvHFP7D+CX/dAnJ/CeXckXTUWugFHccQQYRdiCUMebf6?=
 =?us-ascii?Q?D0q0bjPNtkQ/mcDcAnDXJBVcFptfyI62v2Vhe/iEwH3fWCqrTISg79FHcVzW?=
 =?us-ascii?Q?mKaR6WBW/ch4OPc4AecH3ndrarPm7kdluiA+imlyRgOfm4lvzP2YrE3nTxIC?=
 =?us-ascii?Q?0R6SEuAbLYEQAiwAVdkuGn4E6Wk5XR25P+dF0lvDc4Lykqz1urW06BFV2FWS?=
 =?us-ascii?Q?hTJP+3CUwtb3OTKiFLIFdzwq2wMpU3Npmd45+6bjbKhF5D2kyggDhpNDyKdt?=
 =?us-ascii?Q?Q/hnXMDyNoBJUHgIppMey0J44APZ/ThUMV+z++AVgPAPvCkjr+87D+GQ9Z8L?=
 =?us-ascii?Q?80xcdh/WrI+R+HuQCUuo3S344CLCmNnuP2VrY++2owNncNKFzMsrPk5SriII?=
 =?us-ascii?Q?viL3nb0MHKr9fcl4GaXMplYSEMXAl3+TymtFzEuRytNwUloIhic2N9pyJOeA?=
 =?us-ascii?Q?MyF3EZtKkiReeVcZoQ5LuuSeqa7vxp93oGhC8/67FC7Yh/fULBUny8KrlTA0?=
 =?us-ascii?Q?1NUFz4n53AmxLBOhVhZf/ae1HzQ/tQI/o8OCYXwbgYjYTPODohix7PPaNYKv?=
 =?us-ascii?Q?wog58jnEsQXKEPuM78voIX/DjIySjpBnPrKF5vmejQpbP4phTsJyqYiAw3AD?=
 =?us-ascii?Q?jHOjS35ZAVs//JCkcqOUJG7eVCQBsuvX7//m2COWR9JPoeMn0QaSjRbLpxkQ?=
 =?us-ascii?Q?m4mLACByXo9ICpUyonuxXFh7KdoVIg/J6hZv7/87yNEe4Ex8n0VjMYeZ19BK?=
 =?us-ascii?Q?b+r4MOy8Nv6odFklDTYcIqbv1pSToZcIy/dJkOlS2DbI6h7HDujfLl3a6/Fc?=
 =?us-ascii?Q?IbZsEuntDX88UqlgBjn2FGcD3fXb9PT9zZUd/A/N0adONOwwAeuI4lrK5Vdk?=
 =?us-ascii?Q?1vt4KpCkgPMHmQl5YIUnYENZWfyJh4Cnfn9cwRY8IPOnOYJsNTtpMkyadsAf?=
 =?us-ascii?Q?Xp9of5/FapYcCMoKO2PpiqJDDPEzn7RiBbNS1r7OuIPQy882Ka7A7EbkTFtI?=
 =?us-ascii?Q?4tgU46eRbOj+T5naNKPUEBUW/4sNEJ5BFwg/9BpMxplF+1DZElXLmToGhETl?=
 =?us-ascii?Q?/e9zjnAFGZJspDL+JocvL0F1jzzaXWN+PUbsYO1wM0sZ9Pvh+IijyMbWg3de?=
 =?us-ascii?Q?9705GDx63OkOjpRnC7QXTnQ+ylAPduN/6DlhsiGzCapEFbq8sBGXn4uLDHOP?=
 =?us-ascii?Q?LgTqXMQOAWWz3tR649pIY0DKB0voC4rRZRRRV2ilJj8lrheN7KH1HJcIUwyo?=
 =?us-ascii?Q?GP+lglZCRTp/JHKRiZKvWpvRCKy2RoYJ4pD+HaR+5FG4O5QwqcwKf5r+Nc73?=
 =?us-ascii?Q?Z29SIL7xUDfFp+AepkRxpSa225XeevFLTMP6M5C/Q06FILmchz39UIgI69mj?=
 =?us-ascii?Q?WE7XivHmc6zLsJamKs+1mDpl7+P79T+KR7W9shZqHtP55XINTtcB4B8WqlFc?=
 =?us-ascii?Q?ie8gdfjsx/zPlzfOEIQWxK5eQstaFm4CTmFLfL6deQl+tZXAP3s660PSGT7x?=
 =?us-ascii?Q?x8DwI44immHXZPHd0E4GZMNiAPSw3A4LeCHuKTh4dkzmoPcjHQXOtUBNHrjy?=
 =?us-ascii?Q?op1SgHirrC0Nm5vKpOM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deee01bc-c29a-4e98-7a32-08dbe7664c54
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 12:11:15.6331
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kwSPc6GfHLaLOX5fDg3gCm9tUQcWRJywGVI7eSBAuF4UhJv7HUSPG8ZFO5izoXCe1oKxfi4bdVJRQ3tFFFFaGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5506
Subject: RE: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Friday, November 17, 2023 5:35 PM
> To: Parav Pandit <parav@nvidia.com>
>=20
> On Fri, Nov 17, 2023 at 11:45:20AM +0000, Parav Pandit wrote:
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Friday, November 17, 2023 5:04 PM
> > >
> > > On Fri, Nov 17, 2023 at 11:05:16AM +0000, Parav Pandit wrote:
> > > >
> > > >
> > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > Sent: Friday, November 17, 2023 4:30 PM
> > > > >
> > > > > On Fri, Nov 17, 2023 at 10:03:47AM +0000, Parav Pandit wrote:
> > > > > >
> > > > > >
> > > > > > > From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > > > > > > Sent: Friday, November 17, 2023 3:30 PM
> > > > > > >
> > > > > > > On 11/16/2023 7:59 PM, Michael S. Tsirkin wrote:
> > > > > > > > On Thu, Nov 16, 2023 at 06:28:07PM +0800, Zhu, Lingshan wro=
te:
> > > > > > > >>
> > > > > > > >> On 11/16/2023 1:51 PM, Michael S. Tsirkin wrote:
> > > > > > > >>> On Thu, Nov 16, 2023 at 05:29:54AM +0000, Parav Pandit wr=
ote:
> > > > > > > >>>> We should expose a limit of the device in the proposed
> > > > > > > WRITE_RECORD_CAP_QUERY command, that how much range it can
> > > track.
> > > > > > > >>>> So that future provisioning framework can use it.
> > > > > > > >>>>
> > > > > > > >>>> I will cover this in v5 early next week.
> > > > > > > >>> I do worry about how this can even work though. If you
> > > > > > > >>> want a generic device you do not get to dictate how much
> > > > > > > >>> memory VM
> > > has.
> > > > > > > >>>
> > > > > > > >>> Aren't we talking bit per page? With 1TByte of memory to
> > > > > > > >>> track
> > > > > > > >>> -> 256Gbit -> 32Gbit -> 8Gbyte per VF?
> > > > > > > >>>
> > > > > > > >>> And you happily say "we'll address this in the future"
> > > > > > > >>> while at the same time fighting tooth and nail against
> > > > > > > >>> adding single bit status registers because scalability?
> > > > > > > >>>
> > > > > > > >>>
> > > > > > > >>> I have a feeling doing this completely theoretical like
> > > > > > > >>> this is
> > > problematic.
> > > > > > > >>> Maybe you have it all laid out neatly in your head but I
> > > > > > > >>> suspect not all of TC can picture it clearly enough
> > > > > > > >>> based just on spec
> > > text.
> > > > > > > >>>
> > > > > > > >>> We do sometimes ask for POC implementation in linux /
> > > > > > > >>> qemu to demonstrate how things work before merging code.
> > > > > > > >>> We skipped this for admin things so far but I think it's
> > > > > > > >>> a good idea to start doing it here.
> > > > > > > >>>
> > > > > > > >>> What makes me pause a bit before saying please do a PoC
> > > > > > > >>> is all the opposition that seems to exist to even using
> > > > > > > >>> admin commands in the 1st place. I think once we finally
> > > > > > > >>> stop arguing about whether to use admin commands at all
> > > > > > > >>> then a PoC will be needed
> > > > > before merging.
> > > > > > > >> We have POR productions that implemented the approach in
> > > > > > > >> my
> > > series.
> > > > > > > >> They are multiple generations of productions in market
> > > > > > > >> and running in customers data centers for years.
> > > > > > > >>
> > > > > > > >> Back to 2019 when we start working on vDPA, we have sent
> > > > > > > >> some samples of production(e.g., Cascade Glacier) and the
> > > > > > > >> datasheet, you can find live migration facilities there,
> > > > > > > >> includes suspend, vq state and other features.
> > > > > > > >>
> > > > > > > >> And there is an reference in DPDK live migration, I have
> > > > > > > >> provided this page
> > > > > > > >> before:
> > > > > > > >> https://doc.dpdk.org/guides-21.11/vdpadevs/ifc.html, it
> > > > > > > >> has been working for long long time.
> > > > > > > >>
> > > > > > > >> So if we let the facts speak, if we want to see if the
> > > > > > > >> proposal is proven to work, I would
> > > > > > > >> say: They are POR for years, customers already deployed
> > > > > > > >> them for
> > > years.
> > > > > > > > And I guess what you are trying to say is that this
> > > > > > > > patchset we are reviewing here should be help to the same
> > > > > > > > standard and there should be a PoC? Sounds reasonable.
> > > > > > > Yes and the in-marketing productions are POR, the series
> > > > > > > just improves the design, for example, our series also use
> > > > > > > registers to track vq state, but improvements than CG or
> > > > > > > BSC. So I think they are proven
> > > > > to work.
> > > > > >
> > > > > > If you prefer to go the route of POR and production and proven
> > > > > > documents
> > > > > etc, there is ton of it of multiple types of products I can dump
> > > > > here with open- source code and documentation and more.
> > > > > > Let me know what you would like to see.
> > > > > >
> > > > > > Michael has requested some performance comparisons, not all
> > > > > > are ready to
> > > > > share yet.
> > > > > > Some are present that I will share in coming weeks.
> > > > > >
> > > > > > And all the vdpa dpdk you published does not have basic CVQ
> > > > > > support when I
> > > > > last looked at it.
> > > > > > Do you know when was it added?
> > > > >
> > > > > It's good enough for PoC I think, CVQ or not.
> > > > > The problem with CVQ generally, is that VDPA wants to shadow CVQ
> > > > > it at all times because it wants to decode and cache the
> > > > > content. But this problem has nothing to do with dirty tracking
> > > > > even though it also
> > > mentions "shadow":
> > > > > if device can report it's state then there's no need to shadow CV=
Q.
> > > >
> > > > For the performance numbers with the pre-copy and device context
> > > > of
> > > patches posted 1 to 5, the downtime reduction of the VM is 3.71x
> > > with active traffic on 8 RQs at 100Gbps port speed.
> > >
> > > Sounds good can you please post a bit more detail?
> > > which configs are you comparing what was the result on each of them.
> >
> > Common config: 8+8 tx and rx queues.
> > Port speed: 100Gbps
> > QEMU 8.1
> > Libvirt 7.0
> > GVM: Centos 7.4
> > Device: virtio VF hardware device
> >
> > Config_1: virtio suspend/resume similar to what Lingshan has, largely
> > vdpa stack
> > Config_2: Device context method of admin commands
>=20
> OK that sounds good. The weird thing here is that you measure "downtime".
> What exactly do you mean here?
> I am guessing it's the time to retrieve on source and re-program device s=
tate on
> destination? And this is 3.71x out of how long?
Yes. Downtime is the time during which the VM is not responding or receivin=
g packets, which involves reprogramming the device.
3.71x is relative time for this discussion.

This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

