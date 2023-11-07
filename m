Return-Path: <virtio-comment-return-8245-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9635C4332F
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 11:24:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 244E02A8F9
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 11:24:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F22B09867FF
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 11:24:15 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D64129867FC; Tue,  7 Nov 2023 11:24:15 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C96AB9867FD
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Nov 2023 11:24:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F0vBuwbJ2T7Bpmzj9FRsKodmf3/D/K4qaYqnMQ/4T8lBpRtKs9+vb5vPunRLesS4UtN07zM47HLGUNA3TW8Jv++ttVzDjVzynpnV0Rp1TicAfttECCAigwvOfo14e0Qwm5thijnBCBIwyQ5e4o6YcPNnl5p719SmUHg+bD/zBa5ZpskMgGvbKn8Yvvm3f/Evm/aAWgMwGGp9gwghlMBTmCpm0B6XkN2JHFFGK0vW3kIEKbGbGF28ryISY63nzWKNMTSR56PpxPD4tjfP9t+7zFj1/p85WVFbth8FiQhtJhFTFeq6ienQuI6ZwUpyofyxEM2r+KL2yYYB6luEF8k6Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVcsCT7Oo5ornfnM2KOEEWot6jpmhR5KzAAIuQ5Zcew=;
 b=fZp4n8u2MfuykEsiKkxw5V//S8mokw6bnrT3EHd8sR4l3Ipu0nxa8lnMDjzZdPI7tfe22ItfPyjD7fa6ceR4ybWgCmGqrhCooPI0hAlK3xeZ0aU5snWXT/adNcj4aNzBbwn1weyVKqSx84uepVX5398S0/+xdvMGFAUMkpjVoiQRycoc30iu9wB+wgEUViQzc+hCOrQl4shgTC7lS5amDirMnBbjA9yV+PTBOYaz8zmCkv2SZjNZuTWe/BsGiHjQUb4Mo2fqWXHhA/Xf3BXx6B515imbACstprrOHsuGMmqoY/PCTU1podCcYdbPFv9LRKsgL8uWCUGhaPedU0xHXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>
CC: "jasowang@redhat.com" <jasowang@redhat.com>, "eperezma@redhat.com"
	<eperezma@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Thread-Topic: [PATCH V2 6/6] virtio-pci: implement dirty page tracking
Thread-Index:
 AQHaDkFr7w3tkrCqqkSwyxm5dwAptLBoapSAgAABpXCAAETRAIAACO2QgAPyz4CAAAX1wIAAWYwAgAAWBzCAAYPtgIAABqgAgAAGLQCAAAnHkA==
Date: Tue, 7 Nov 2023 11:24:13 +0000
Message-ID:
 <PH0PR12MB548142AE109CA96BCE5A351ADCA9A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064730-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D028E63E6CB0AA7F4149DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fdfda658-e89c-41f4-9f4c-77d5d9b1b642@intel.com>
 <PH0PR12MB54818179419B06412D7A9C84DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <445ff573-72c3-4fe4-9e07-e7fdd2dc5750@intel.com>
 <PH0PR12MB54818BAE4BD33983E6108FE5DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2615baa2-9450-4504-aa8a-e46fdbb332b8@intel.com>
 <PH0PR12MB54810847007367DD75FA3D60DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <431c0495-f0d9-46d6-8336-cc2bd293cc35@intel.com>
 <20231107051012-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813AC62A9D6811585A159DDCA9A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To:
 <PH0PR12MB54813AC62A9D6811585A159DDCA9A@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SN7PR12MB7417:EE_
x-ms-office365-filtering-correlation-id: 9cceadaf-1d3d-42de-dcd7-08dbdf84120d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 uuyW9Lzdgkz6JbTW1CQqvIBH5MH4Py8HGBmbgoqO8T3yaunoyg8mVYYNL/FddjTyJlZNrzFPcYHuc5TGruWafiPvXD7iT0/2yxjX/6kozKmWixUXrC3Gn8CwME7PZatHZKadEsTzc4YbiVK74Z1nTRhf3KlLlvIJrSP3YrTfQjmxOQhvwXBzf+nu08o4MXHpjW4QroVitNcntqjTQ++vKOkx7uC3elxtlGqav50DrfAVqNsWIr0GjD8N/RR0GFqT1TBkn6KehRZQXK4AsucZDztwdzv5kxOd9LLcGaI42pStLWTcS0BiS/Vp0i0tlpZbOOFvy36UmQABHqUHTLiUSghklDbOVqHhXd6q+ifU32kAfzSvtYGVXbSnxC2YqxkRrhxcadlemWbE142fidNPRC562Vix0gt83M9wKfBhexEp8S6DZF73QFiUUOvy8diX9WrRJrQBNZp2LI9EDvy90j4BktBy5o0J359L4ecobxEoK7HjpdikERxW3yLg2i5PKmm/ekwEuOfhjAHzVt3ZaB+4rFBIpLWlfMXGMKD+ldsdnCMNV0Qj0WGUTLZoSLo/Jo+lJtQsvF1BsgBOqvYMV1FKemSCvMW8tSpisOXTCDDvv5XjTtlZpxp4NUP32j/82i7P0SghVRgz1y1/UsHdRQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(366004)(346002)(39860400002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(38100700002)(5660300002)(41300700001)(4744005)(2906002)(86362001)(38070700009)(33656002)(122000001)(478600001)(26005)(2940100002)(83380400001)(9686003)(66946007)(110136005)(76116006)(316002)(66476007)(54906003)(66446008)(66556008)(64756008)(7696005)(71200400001)(8676002)(4326008)(6506007)(8936002)(55016003)(52536014)(14143004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?IQebTPEHkNNupLOsVtFwbmZISdBKaw8bLRSGCUkpKO0hSyU2y9M1DHmEzFvt?=
 =?us-ascii?Q?bToQAP0WU5BAnDbPmTmfRGzpAm/hIFGGRsXsE+KaNmdXWL2f0mWvb780T0pT?=
 =?us-ascii?Q?olBxENM8oqy/HqyC+fSFfCI6BtEM+Ssz6gkeaYMo3LUo6ydoMpNAoOYa9/tp?=
 =?us-ascii?Q?O6TYN0bBGU1ldd8/4/jHjd21+gkXyQq+XgepcGYM0vOBOecqBJPs1rFXKcuf?=
 =?us-ascii?Q?cC3ohoX42ojNbDFRK7X/4QAoAfuxLuMdiJt48UYWPqSjgP3rM3u7IL92L6Oo?=
 =?us-ascii?Q?FsQoWIRYzoelV3hwaH1FoMZ110atyYJQZ3t1nZ2zM5N3J0DNum4MNpVB36Jz?=
 =?us-ascii?Q?MJUVtu3DgJGLrcRuB17X5HJIdD1P93kR+UHLN02IL4hocjcbk4IfgTVPrg7f?=
 =?us-ascii?Q?MRv3/kXzOx41DHqeArJBarNn4sQiISJJGI/pIbtEHBV+OYQoBtE7wF0hqeT4?=
 =?us-ascii?Q?tfBUzsHQiVD4vlPoWEBOZh+R9gcVW4bH8YC0cJHb9eTZ9IGOkYrE8UOfPLUb?=
 =?us-ascii?Q?9bh93wblGdkW4qdZEv68ZTPWyEYitZfV0lhFLmI+Ic1tYqOPg9PWaxlJrFuq?=
 =?us-ascii?Q?6nq0szeExudYw44LM8phljzp4RKYCQ51ijFzVhYU0SqCJ/kbFvFTpLmgvyy6?=
 =?us-ascii?Q?mX+M7kGsjujK+FqnPIqBL7zHg8w7s4wEOPyR/SOb6ZbmJV6meZ6evoFi1YKp?=
 =?us-ascii?Q?ce/E8xAzisfKyhvlm+oMoTU1cECBwI/noxD6oxn32N3ZPbsotwkQM30zO2/x?=
 =?us-ascii?Q?4SZMBO78flnkqDCL+ma5WNZUr6i9vzsU0Z3bdk0RRb+Jvhe+o2/Xl4zxMmky?=
 =?us-ascii?Q?TQ9y79ghMJWwBOcVs5Ys+F0KSdnbNqHWwK8VFBS4eNkRRq+L8c6hICKp4YNL?=
 =?us-ascii?Q?6FvlCDbF58rs45FHpxhssLDItqSDf19fFgJmZssG2SkpRTp0yphuDOM2kG2s?=
 =?us-ascii?Q?nKbjRrhiBDjyRE48VOsELH7f/1gVYZmJrO4gFmFPhCkYng0n6hZ//AEGgJfh?=
 =?us-ascii?Q?hiCd/XLP92MAovHz+GS2MX2T4a1HtDGzfz0cXE58s537l2d+fjne/kyxfR4d?=
 =?us-ascii?Q?noJyeFaitZm+gzi9AzplLbb9RNg2syRKdz6nDwIW74plisTMeVdkcwmpoCan?=
 =?us-ascii?Q?da+9M9pjUUSMsvLETBlctNsHJHm5GnBnpsJxFK4DnH018jGtCc5fSIjSu4xn?=
 =?us-ascii?Q?O57KK8EdosAfKs7+7nl8/fI0HAswRb9BqnmjbroBdQAMesGILvLGFCh2g94U?=
 =?us-ascii?Q?0VDSzl03s5+KDhVQJ5Hy8on030g3+P3lqilRzlyNJAKiUUQQLeHlLNVrDR7S?=
 =?us-ascii?Q?5qXhsLmSXBPr03wna5ZQFNWhIt+/vwlmWZdmxHO/lnPcerRYmN8tIkngoK4r?=
 =?us-ascii?Q?gbMhR89Fr4i1mTPt5tZ+IR2CD2JDxr3MqnotjEiU0OiNeoeEzQh0hzhFnIzD?=
 =?us-ascii?Q?mQMh9d07KTQPPSTdEUFaTVeEtaV0L+zuQ9TUq+OmeZVhCTPqDk/1xg6maM/C?=
 =?us-ascii?Q?uy2DVJA8zQu2lSG1wp4xQRGTZpX6Jwfu6zDRjjnDkePRB/oOGQu6gHcuGa+H?=
 =?us-ascii?Q?EvPzt76OClYR/lv3tWc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cceadaf-1d3d-42de-dcd7-08dbdf84120d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2023 11:24:13.4489
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AsJ0w0E6fdp0n80KpaAoJMgLAa1aXmJ8Wu3AG+aBi2Jx7/1RdKCvXAGe6wyAAaJ4JpZnjSskS3IYfEnKY5E1Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7417
Subject: [virtio-comment] RE: [PATCH V2 6/6] virtio-pci: implement dirty page tracking

> From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> open.org> On Behalf Of Parav Pandit
> Sent: Tuesday, November 7, 2023 4:43 PM

> My humble input is:
> 1. Accept the two use cases listed of vfio and vdpa being practical to su=
pport
> existing stacks 2. Try to converge two cases; if there is common virtio s=
pec
> framework it can use 3. If they can, great lets use it.
> 4. If not, both use cases need different infrastructure, so build two.
>=20
> Do you have any better suggestions to support both use cases?

And both use cases can be serviced by proposed admin commands with differen=
t hypervisor layers to use them.
If something is missing, we can extend these admin commands further.

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

