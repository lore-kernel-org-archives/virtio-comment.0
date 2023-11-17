Return-Path: <virtio-comment-return-8419-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442B7C54FB9
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 09:41:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8FD9A98B8B
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 09:41:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 69E9F986E25
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 09:41:47 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 546D1986E1A; Fri, 17 Nov 2023 09:41:47 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 44876986E1B
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 09:41:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ellRlx5tl3594SlAEI6KV5A1s6KyIepqHNgHrbkrppIuaWLy/kkz8I+jPmjHRTkaPXF20ZvUyQ9vntFtFZ4dHcLHLQ9GI2fjigNtfZAqWbdRZuv+0GiZBBH68+UEld8+4Nd8BA+Xv1pbtogPTVan5jrc4Pl7fS5vRI4CvGmpQKpmZPgEGjc1c3GIf4mL7tHJyGriA/M2dZdJY2YMwXsPkb8uX0Vs9swnniy2YET9/WgSBMeUpPCGSnNh3JXm64pKJ2NpCbuTjlifvflQKIOchKInaEsedGAk/lznHa43ev2OzeHXK4xq77Afo7jnZ6+QB2lkLEm1lhrXwP5d8xjuRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+OemTTmK+rbJnwyyp8HSd1a9nZfXmFeRoKJG8F2YOFw=;
 b=VITmpQrRmPirl3DRgWVcIbC+TAlPFx0Eci3TXgcYOSud8luryTk3eIMuZmJM+dDxZzD4sbyBI+7BABR8rkCMoRSrtMdUGa1+9rJx8LWVEnhiUh7R3vMCMQWrJPl7cDIIQ6V3RpMcmZbDq4j+Q7tFB4WGVzkYrguIcZwSmfkXBPsvtAw5FgDUHhK7Vc8/gNLxLdd6ezrLQYiU9GuNzS95NgGIvYq14bvEpW/IxhcXTHHwQ2tBe3XkMP+55xXhljNg9rUMYEWTc19vXv3Ox9npILmUGCKb+iywNz2RW7N8znwUjV78QR0uEdd0QgGZi9t0aY3cTPJgXKfzkJFRPh1DZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>, "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Thread-Topic: [PATCH v3 6/8] admin: Add theory of operation for write
 recording commands
Thread-Index:
 AQHaCzPonHREgkZknEiTjfT1JtA3fLBjIMmAgAAcy4CAAWD+gIAAKSfAgAGqygCAABTkAIAGWMEAgAADI2CAAWVPgIACFpEAgAdP4YCAA//WQIAAxB+AgAAJgRCAAA8CgIAAHSmAgAAA6/CAAEWagIAATXNQgAAQ3wCAAAB/YIAADsiAgACQwGCAAGEbgIAAB4aggAAG2gCAAABcQA==
Date: Fri, 17 Nov 2023 09:41:40 +0000
Message-ID:
 <PH0PR12MB54813F2F62F87E42CD5DB4B0DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231116023443-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548118E76BAFD5FA470B92A1DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116064611-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54814EC9577B1197E2A13BDBDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116121958-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481F4D1B07F2809AA7D7C9BDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116131303-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818DBAE43A566C807E1AE9DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117031251-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D7C85F006AE7292E1D82DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117042446-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231117042446-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BY5PR12MB4052:EE_
x-ms-office365-filtering-correlation-id: 8069c8b1-d307-4156-3b7b-08dbe7516704
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 1q81v1ikcoza7ib4cuiZLWZP+GhKVSfyz+91gE3xHF5MtUlGduk2u2dk5x18rCqFo2gQto8pJxFQFKwse131w2bpSgg0sovTOkOSA9gfD4Isknu8Nj4W3+7Nt80rbj3i+yVc4QCrKlrBA5xGBzmu8pYFgS5Osk6hbMWZSQMpSJH6tKNen5UYZpssDyBzsrPpDYGcqqY9nAfPGDiOL6rSLL8UvlHEMfp4tK5t/P1Sp5Fl+68Rvpu6rCF0bMPwhGxwd//1zrWnNj2JVCRAML92hLt/2U8+PZIqiiELZ3GZY/xQDG6Qj38b1BSahzE8wDxwM5lP8i6l5fcPtcd6V8FT4GPw/cQxI9/vhIGPQoLdiH30zN17B2e85zo11F7VxP61nh8Q3FtjTjRmT7OpkQbm5mea/28PtppXljMlm4rbHFcEQK8/WpbRcrJwuQ00vZIr0cyUHVSXHARkEQ8Tc0+ZSm38ebQ7VQ0VqzLVUCpL0UNt9bpIdxw4iSy59Lt5Yved8d3ikJzXzqNsgPT2nAXUxUixPTVssEXTlrnZfOkDU9PmcXczOl9N+P6a2JVQNh+0T059EE0WV3pyCUebn4L3bSsZzPbdnRe8qHUpdyPuBXvcNJyf+ADAu12jv0rNefeK
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39860400002)(376002)(346002)(396003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(33656002)(71200400001)(7696005)(6506007)(55236004)(55016003)(9686003)(86362001)(478600001)(6916009)(66946007)(66556008)(26005)(316002)(54906003)(66446008)(76116006)(38070700009)(66476007)(64756008)(52536014)(83380400001)(8676002)(4326008)(8936002)(5660300002)(2906002)(41300700001)(38100700002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?KcJLAMpVak2bs+2NjawbH9HninK7NYLo8y8YrX2oEE18yW+h47en9bwQa8OR?=
 =?us-ascii?Q?6bIooGWF7ZBJgbYkj5heilDPQL0/+0A04FKByC61e22a8fveEkwl9hTg24jX?=
 =?us-ascii?Q?zYzbAFLH1YIYdmxwodJGH5gB/qPQ6sY41vm6Xcb/LZdES5G/Hh5X2MtyNwwv?=
 =?us-ascii?Q?cQInjchjl/FXWJtExBAWLbO0NDBa/7nNOP6N3AwChWqlCseNXo2KplCLvuAu?=
 =?us-ascii?Q?ZktRvp01PY9nAyJS6kJhNDBU1zzN+V5xihMdDFld7zWuP6izq6cya3b42rhU?=
 =?us-ascii?Q?8/L53qP7HEDipJvHyrGwJ6bjybVsCAThztWDU9wiIOcoYd61YdwEvyyaD7ms?=
 =?us-ascii?Q?jQWDLQuROnwC8yJ5K0AA8ZqSfBejuT1OlYngkG0H0cQb+6YAgDqjl3zuKMfr?=
 =?us-ascii?Q?qx/jOZwdYui1jvWO2JlYgEyQo2zjw5nUxyvbyftkorGGRrsJc1KOlFHF1tYb?=
 =?us-ascii?Q?EipZ1I0C56uGiIlcSz0rxpzJiHK9FR0VBxSvawOUwzf5otczMRg5CMljH4RV?=
 =?us-ascii?Q?p2NZ+APbVMNbSKFmY2Jy9//fc1R9cQDWFucHQMB9T2uUOtOZJho6OtPvBOfo?=
 =?us-ascii?Q?Mo2Ady9c1vUE6g2s+k9v6LrVa1YYnvI4VV5dXhIMKSrA+805Ia1quZioAe7L?=
 =?us-ascii?Q?InnhbSswWrNLzurVgqN7Qz82kUREiBokhqbhAjHDGgtDprSp3Uzi63w14q3E?=
 =?us-ascii?Q?ztRksfUB+uTWs57Jilgz7HoHtU/d4JgszVSpP1kJmbelxQj/OfYvQKKIIVE+?=
 =?us-ascii?Q?nROOvULvVcnyEplChYFFcdcMWiXfS1BDKOCQCI6rNPoOoGvTLpWLKR5+2gwC?=
 =?us-ascii?Q?OWT2oPcTe4D9m8htA083svDUYMMPMstr45cGGuWIYL+vT1MLFlSJPPxDvepT?=
 =?us-ascii?Q?DURghXJANQkrsD04WcJDifHgfuFwVSbVM9rJ3j+X4fmdRJa2wAOP1S05KGRq?=
 =?us-ascii?Q?XsUiIPOAtrYTm4wmZ4864O7c27z16pzTWAsiQWePjUY79bELWnna4pnj0KrS?=
 =?us-ascii?Q?lLWL5RpRxBS0SkYmnY0ZmfjQnFXZkZsaECSAq+k9Ki4aYiglzRnSvNLmSJHC?=
 =?us-ascii?Q?0HJb5NLXYh5zbzQCOZsTSxtnwPQ4yX2/5UX2pVo3SQj0dHd4xZ/Z5SbPrpH/?=
 =?us-ascii?Q?+8lBikgC85YwP/SnOHpN1/h3CO3Fe04CrR/f4pR3j3cxrIaNUtBbaSirDFPw?=
 =?us-ascii?Q?vIrG9IFPfOn+nkSj5s7FGn/tKPJjyrkYQO3k42TUWjuyfpcfIUDyA7l5Nok2?=
 =?us-ascii?Q?9F2/dyb5VbKssZ91GQ/PG2hVN7iScuh1RlBwT4+MIBA2N44lJVf9AimYP1DU?=
 =?us-ascii?Q?JWdz6nJofLjL2oakXZH3D7S+F5NKsMDCqzv6m6VH7Di13Jl5PSDOK0fvw6Km?=
 =?us-ascii?Q?gcX2P4qLIGtDWMDbuggtMoElqFluh3UODlhoqDqsqQQMLLdif9I7vxyeHJg3?=
 =?us-ascii?Q?ptyNI8SNf2p3H9MX6rFOOee2HMmXh0trDfq3way5OQ2YLmhP3oSYa1k2f8W4?=
 =?us-ascii?Q?VN8P5hwgNGLcoRm6mLMqWfyVZI560WONIN0m9sJhkvk15bZYaHNOCQGFh96r?=
 =?us-ascii?Q?An+8xu3Pw26S1CGkr50=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8069c8b1-d307-4156-3b7b-08dbe7516704
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 09:41:40.9314
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 480Vrs970L0DDDsKQ4iv3oEgvyczn7Q+qYRifDbWRvAGIm5q432AuvJyIUnwp60jygOVB1B8D5P/NDDwmr26Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4052
Subject: [virtio-comment] RE: [PATCH v3 6/8] admin: Add theory of operation for write recording
 commands



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Friday, November 17, 2023 3:08 PM
>=20
> On Fri, Nov 17, 2023 at 09:14:21AM +0000, Parav Pandit wrote:
> >
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Friday, November 17, 2023 2:16 PM In any case you can safely
> > > assume that many users will have migration that takes seconds and
> > > minutes.
> >
> > Strange, but ok. I don't see any problem with current method.
> > 8MB is used for very large VM of 1TB takes minutes. Should be fine.
>=20
> The problem is simple: vendors selling devices have no idea how large the=
 VM
> will be. So you have to over-provision for the max VM size.
> If there was a way to instead allocate that in host memory, that would im=
prove
> on this.

Not sure what to over provision for max VM size.
Vendor does not know how many vcpus will be needed. It is no different prob=
lem.

When the VM migration is started, the individual tracking range is supplied=
 by the hypervisor to device.
Device allocates necessary memory on this instruction.

When the VM with certain size is provisioned, the member device can be prov=
isioned for the VM size.
And if it cannot be provisioned, possibly this may not the right member dev=
ice to use at that point in time.

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

