Return-Path: <virtio-comment-return-8179-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2DFC4332F
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 04:03:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B441A45B26
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 04:03:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 98A7F986708
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 04:03:47 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 83C719866FB; Mon,  6 Nov 2023 04:03:47 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7381C9866FC
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Nov 2023 04:03:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fp9zCUElupncYTFJAsQmx7w3ex3F+cuGLdITIy5RebCc/9sf1/2ncgwIqbZU0efa0pCqh4F0c7ddTvz9gH37HxRyU9VDIuGbktdiDySTPvKntXCyTOXjdLzFCLFM5sJxkzhLWNrQtkkfgPKCu0RhFz2g04tCecSUEUtZJagGd8PL5Tt4cVerOIiqHGKhKLBct0y9P5U1MaZiCi1X2BTHdp66YdLt5rRZD3bnisEQnMBhV092Ycw4/yLIC03oM9/nSPkA5t7gH72agjFUesMI557bK3IpaQwiva1GIAz+L31l4zdoqOUH/FAdJ3OQPNRH/mntzV5DEc3R0+Kela3XwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iLhfMAJsFtI9UpfELL32ESam5y1C9hnuOjvrZxrfDWc=;
 b=fI29IiAzUGNa625PpeFMLQrc3YmOu3FJaEKJgnz11dccCbtbu/I32h1X+jjU61h6asCGkcI4DFLwiuk4CA0SbUcaFWPio+4S+Vq9Dw+3YoDCQAlUycx7Bt9eRYU0ywUSNoIFlkvQqu+4TlMUzZrZAvl3dzl92r4+ROiBed/gdt1ZxWNlN5XjSm9lSJ9F68nY8qIHvVw2ypCgpO691wITFcVdFNJ4R4zuLEFTPCnCMXx+cAzbrf2TqFyZomIuKLUAeGyOFg90Vj1mWpodlftrzm9cfs752NCIzw9ykPyv8pW+xzrVNJnjUj5tYIu9zfcJbGBE9u2VkAfX+/r5Azb90g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "stefanha@redhat.com"
	<stefanha@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [PATCH V2 6/6] virtio-pci: implement dirty page tracking
Thread-Index:
 AQHaDkFr7w3tkrCqqkSwyxm5dwAptLBoapSAgAABpXCAAETRAIAACO2QgAMvMoCAAMUMIA==
Date: Mon, 6 Nov 2023 04:03:42 +0000
Message-ID:
 <PH0PR12MB54819604160CF0A2566AFB5DDCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064730-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D028E63E6CB0AA7F4149DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fdfda658-e89c-41f4-9f4c-77d5d9b1b642@intel.com>
 <PH0PR12MB54818179419B06412D7A9C84DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231105075906-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231105075906-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH0PR12MB5647:EE_
x-ms-office365-filtering-correlation-id: 84791ec2-a6cb-45cb-1f76-08dbde7d5da7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 B5oRGx0edfDIVQEtjpSMdZsmjljJJHrAMYOgkNsmjpaCo3MHEUUJWxp4avRVmkppM52fTPWHaWnyC4TCI3EPU88STOFLaBUu2+iT1LB1+gVZaaarCRj0g/PhAWu1JQjQoDS4IrpJ190Nuz/E1dNgFkQC1a0m3F4GSGhLnSQH7+/ye7CPKQx4UiAyTgZ8XB8qfzEXo4+TBhQvTz1YFCQG4BT1/NuxMHCMdMquZPmQ1S71B0ukF7AG/id/ZEz2K+5TMrbo9tCJdPk1IrvZaeOltpkmLMi2skDpIPPZZJD3LC8QDDWv/sXOBOBuWSQ3AcPo4x5pv/m7/yL1BNV0JT1v+Pe5Lj8SHdMWUmX6qVUtLo4S/ztsGQfAdHMqXevpKs98ve0kIot/SjOWVquUe/DIlan0Mg2cewQ1jz6zIBlpNmhtjFXmtTA8qdr1k04b0/iBub4PvdHUTVEsq7qZJIK+28qBrSsHn/8zyTNzaJXHfiNaIhO8CicUwwYdU5GfDWhdMRS0IsaOte0opTNqqtHzeKUI58cYBGR2zJAxVn0fvxBywRPo91g9uL8l3dWUTI4gfN2Gk227PoSO3OAOEPBGsSbdoikkj0ZLoio8BcVh7mUYj7EoeUCIhZp9Flp4oNrGUFznRsgC3yU4Ena7xD5XCQ6OHqoE9j34Pt7ki+szoGIIORJKLzpJaalpAGuno2kTQM1eyRhouq5nUSFJhDI/6+KufntjqKkfRolV6GsmmH0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(39860400002)(376002)(136003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(38070700009)(55016003)(54906003)(76116006)(66446008)(66946007)(64756008)(316002)(66556008)(66476007)(86362001)(38100700002)(6916009)(33656002)(122000001)(83380400001)(9686003)(26005)(6506007)(71200400001)(7696005)(478600001)(966005)(41300700001)(2906002)(5660300002)(52536014)(8936002)(8676002)(4326008)(14143004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?K56HyLy2nFdqYa73aRN3Ku5seZfk4CxSYJXICFocOLYKgKmDKs4j0LERQXwh?=
 =?us-ascii?Q?U21JzACVK8pkbTceAU1S3VsgjxIHAqsRjnt1mEMZ7pnhQHrG77PBsw7H6Drv?=
 =?us-ascii?Q?/LlQubdQ2u/sdtWrcI2xsjceX+azlS7rbT6GopRauVmSsJe2xYx+DgZtSlH9?=
 =?us-ascii?Q?4dSFDWATc7n3Y/mwk94/v+Ocn09uocApx68llnw1ZIrGhj0RQVGFmxwUm1K6?=
 =?us-ascii?Q?0VDLQ6kfXDf46/8pqUrvXRWX3ZduYt+SJZNxoEGZY08s6YRDHXZkdaAPXIPy?=
 =?us-ascii?Q?BC/Kpv/w81si5xuxYXvhCjZLOZBNpMlBrmilMxWRqrPL53wKXBvwYpvuhivy?=
 =?us-ascii?Q?nzqEmLlwusVBPlz7pNlB0vMCMvkA3uDDxnrMZyhMZwo+umH8DSMiVIoj3EyB?=
 =?us-ascii?Q?TJ4o0hnwhtzvi5fCCIf9fvpm5dOC5VRuYfljwYfIr5B8DCW/r7vAbSWCKhCI?=
 =?us-ascii?Q?nyhFR2hg8zqeqepWb78PCBKUR9gOAYXYX/My0qrcwvDG/k5nyR+awkN1yHZR?=
 =?us-ascii?Q?tSuGcCtmX1TSsNM6KVcbOcVnasOXNc4SZuQJ7bqYw1tQ6wyu70VqEpepMpry?=
 =?us-ascii?Q?nLcQglackixhQBcLExyWMh3D8q0z0DOJNzHr75JYVKITUgvl6nnh1Q/kxj2Q?=
 =?us-ascii?Q?oYflP/MDYBeOZTvttFkyHLerEbfct/2lFCRcZwnmexwEttuKePOfJN0Vl0e4?=
 =?us-ascii?Q?cUZBLx6wn2DPN1ExPd260kwo482loOUdRet9JGF7mWMKy5v0I8SlrDDUct8J?=
 =?us-ascii?Q?1GQmXgsFDWLS65B44Un2tvq9MdHtc8UUGZiqt3fT2AwNTRdux+GMsni5KQKQ?=
 =?us-ascii?Q?0XdaOmR/dSxwkMPYCdBeWXeNY/RHhENbMxGxceqgzSVkmZXKknkv+CSffrud?=
 =?us-ascii?Q?xS3JLNj9/lSStlYRQmgAFYiE7U8Xod/+oKoMvDJXXvvJe36bC/VcYR0/B3u8?=
 =?us-ascii?Q?EnXOH0ao57ZX8dOJrDuTBQsA1fHmvU0GMSiOcZvAjZFq5qAIwIR3M9BZ4Ftj?=
 =?us-ascii?Q?9tkyXZ5YZTcB3ynpQIojc/nrnxpbGg4VlwfODokLcO1yF8xNAwLbr/73otwY?=
 =?us-ascii?Q?BIto83eYa2nzOusS4zpC3Ay+OQSRG4z9taPV/EiCIy5v2wP/HkXVDYv2gXXf?=
 =?us-ascii?Q?uWYLefOMFbKAgGviHxalM255WUn+kAjdOub/h9Yhw4k68khJBUZyiUhko+AU?=
 =?us-ascii?Q?WO+7kkR8w84bPj+ajNJF2+zRjXBUDB44wEyVmKfK7kqq3c9K7w5bQ/XdKK5b?=
 =?us-ascii?Q?wWFiittHu+hiuD4QTsSvZ7HEhkovQVMuat3/mCLsep4Mw44050+3Jug52xzz?=
 =?us-ascii?Q?hAxgOpMJuICS4XXui9c0Wj0gmrPQxKXRNQwrlZdV5pLJWzlSs8tXx6sq3jk3?=
 =?us-ascii?Q?8Mt3SM0sBNOId4AjTOyJU3dt4yihbVtiYcxZE0//0WCt+li6fakeKcgjYsZ+?=
 =?us-ascii?Q?4jWWChJ6ZANjh4uDuTmUWblOgYNwvohdKJwyAO4bGKLfh96lzrDZAQJRk1/U?=
 =?us-ascii?Q?jxS6uZpQHEVEpzQLpTWKZq7a5uoBeiMR00l2iQsemCu7h4KIuEWCxl4pgnnz?=
 =?us-ascii?Q?tEsfZjbhclRmfOdugwM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84791ec2-a6cb-45cb-1f76-08dbde7d5da7
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2023 04:03:42.6548
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +c1I/VZOqpMfhQxFYy/AyZo4JI8xPnZjqMSdQkO0o/3Eb9Px8LdWlqEOCVyIidw3qY8HhPLCGz3L886H/8lYvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5647
Subject: [virtio-comment] RE: [PATCH V2 6/6] virtio-pci: implement dirty page tracking



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Sunday, November 5, 2023 9:42 PM
>=20
> On Fri, Nov 03, 2023 at 03:47:34PM +0000, Parav Pandit wrote:
> > > > [1]
> > > > https://lists.oasis-open.org/archives/virtio-comment/202310/msg004
> > > > 75.h
> > > > tml
> > > you still need to explain why this does not work for pass-through.
> > It does not work for following reasons.
> > 1. Because all the fields that put on the member device are not in dire=
ct
> control of the hypervisor.
> > The device is directly controlled by the guest including the device sta=
tus and
> when it resets the device all the things stored in the device are lost.
>=20
> I think the idea is that when this gateway is in the device then device r=
eset has
> to trap. At a high level, ok. But then what?
> Is a full scan of all memory required until device reset is complete?
> Drivers currently tend to busy poll the reset register, if this takes ver=
y long we
> might start seeing soft lockup messages. What is the idea then? Maybe for=
 this
> we need a separate weaker reset that does not touch this capability?
>
You meant the gateway is not in the device, right?

I likely didn't understand. I don't see a relation to timing.

When the device reset is not trapped by the hypervisor, most things does no=
t work, it requires trapping other things to like cvq, device registers and=
 more.
It may be fine for those use case, but it does not fullfill the requirement=
 of passthrough mode of hw.
 =20
> >
> > 2. the PCI FLR is clearing all the registers you exposed here.
>=20
> Same problem, though FLR at least is expected to take a long time.
>=20
>=20
> > 3. Endless expansion of config registers of dirty tracking is not scala=
ble, as they
> are not init time registers not following the Appendix B guidelines.
>=20
> > 4. bitmap based dirty tracking is not atomic between cpu and device.
> > Hence, it is racy.
>=20
> Well pcie atomics exist. Not sure whether it's reasonable to rely on them=
. Any
> data on who common implementations are?
>
Pci atomics are (a) fetch add, (b) swap, (c) CAS.
Not atomic_OR().
=20
> > 5. All the device context needed for passthrough based hypervisor for a
> device type specific is missing.
> > All of those can be used for non-passthrough as well.
> > [1]
> > https://lists.oasis-open.org/archives/virtio-comment/202311/msg00085.h
> > tml
> >
> > > And I
> > > remember this is a point-less topic as MST ever wants to mute
> > > another "pass- through" thread.
> > No. he did not say that.
> > He meant to not endlessly debate which one is better.
> > He clearly said, try to see if you can make multiple hypervisor model w=
ork.
> > And your series shows a clear ignorance of his guidance.
>=20
> I think you mean "ignoring" :)
>=20
I am sorry, yes, I meant ignoring.

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

