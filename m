Return-Path: <virtio-comment-return-8099-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81EDC4332F
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 10:25:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3C2DC2ACA1
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 10:25:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 30C09986BC3
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 10:25:00 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2747F986BB8; Wed,  1 Nov 2023 10:25:00 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 193ED986BB9
	for <virtio-comment@lists.oasis-open.org>; Wed,  1 Nov 2023 10:25:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D6x6nql60tRadmfwqp0KyTdgurff7eGFyYgyFrNVv23B3DkunJp4svjyI5hO15LQ6H35Q8X8kLoecQKdi4/r+U7G85rRaJjvmNE9fOUeL9fL5dgw7d0+Y8w9pvTwn7nIeOjxhVrGY1yZNyYqbGeYi+lTMby1bi+558a0IPzrw36E0OrK0TTZYmZH187pjmUpLzzo7WBI1emqqWJp0DxfmyJ/kWvgCAQu3bU2AIONaKSJ4sqNaorWsbdzq3B09w5l8xbopNMANugwcfQmSSYsshRdCdDBWdZdw4qoQm1TVpB1WeNwAieYZFW9HPahawAJCTbsOwg75Jz2ahn8sZI3hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4l9+HUsDe+6VO6DvYeYF8xKfmJtbkf72gqvvfIcj8BI=;
 b=CJu1Bv70QH+320UtJOm+JbqRtXbKjpF2KBqCq1eFYJJBc1mWSJaIA9DKTZ5/rNtYzRBM08KHc97uzalbtZMFC/S2lkZD/09T+ZPXj9JKLC697X3SssYmUfbgdEV2ATFRzAwa0EvNvncymps2YOge6cpYFvhit8YfdDCLopq3HQexiVEgCyzr7P+QPCURZioLWbOnQYqhvACsHqkM+EfaDlZ+r+j8qD5BptHFCG/hnFqLOzLPOnjCjdn8Gx4NtvwTvdt6uO0ade4/JKpAIh1V8SFxOTVTfJp0D/iC50JVO6ei3qkZSrwMJC32JF6m/5Q7xM6kl0+1iT6QpUGjNNf2ZA==
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
Thread-Topic: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration
Thread-Index:
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLAgASWeYCAAtRh8IAAGoeAgAAAUKCAAARLAIAAB5cQgAAXYICAAABqYIABiiSAgAAMdcCAAALCgIAAADWggAABTwCAAAD9AIAAAmrwgAGTbICAADeVYIAEiiUAgAAAXICAAZfSAIAAAE8wgALlIwCAAAFh0IAGFdwAgAAAUgCAAGlTgIAAAOdQgAGLtoCAAAjegIABFlmAgAAs44CAAAKEcIAAD/uAgAAAm4CAAAJmQIAAHjqAgAAD8rA=
Date: Wed, 1 Nov 2023 10:24:56 +0000
Message-ID:
 <PH0PR12MB54817F0BF1DD55731EA7C994DCA7A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <341b7a16-6927-412e-8a22-4841cd419314@intel.com>
 <PH0PR12MB54813BF8D0F6282A1932EF99DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <640cc639-6065-4828-ac81-0cc809aff293@intel.com>
 <20231031054617-mutt-send-email-mst@kernel.org>
 <DM8PR12MB54806512D1395AB39C59B821DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231101012540-mutt-send-email-mst@kernel.org>
 <DM8PR12MB54802C006C5ADE546783E610DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231101023257-mutt-send-email-mst@kernel.org>
 <0bc21f96-486d-481f-8676-5144225e43bc@intel.com>
 <PH0PR12MB5481DCAAFA84932C9D826C4ADCA7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231101043012-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231101043012-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA1PR12MB6211:EE_
x-ms-office365-filtering-correlation-id: 73d6775d-da8b-4bfd-fe89-08dbdac4cb7a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 j470KVH9HjiM1KBhJVNC/8RRvUY6N3acDP60uPMrFLBtvyF96zrikZTSvYDogECJG2Z7CA5XzslOblnxNe3eKDLMVaHqwGZvsoSA6D/961FnD1pO8VhaX+roMLGtfefhxwItt7MH8aje+rsUpc0vSQE6wNC3xOO2A3y0PLezv6Rb8aUmcjbO6yb0pgFn+Ux+Ie2ojxAyomPV4OBYHXdoJ0l9cC/VC8kwF39K5BlS2O3PKjMr21DkjkKSALdlprXwc2VLbXXOtwHf/5zqJNirXfoCCfzumSxC4IJy4v5laRi4V0USEQ6NJkNNMigUdu4WycWeZ68dZi8QIrP2rQ+o6nHphofSUiUbaQ7wakxI7yQ/YNN/HZH3XR2DQG6/AdTtMHu4dkAE2ohl+zMRRjxwxrSkwUYNrTcut5nxPxX2Y6CM93ConPcePqSRA+ZcImDlZfPJwsjPXwDsKItYlQRAQhk5WZVbiFAToQ6Wf2Zwk/pEeI0gpJyUG3D3sEfU53VIHhQCJq8ozY8hhd4z178kwimn6UVnJCJRzoJYKwkAwigDwrYREdOhISCAJLZQX+utgyx5xCD5r2EaXik8e2tjyPmKPUY4fKLcX5GIABcGiZCMncIJqRg5hd4Fib/4jVcE
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(376002)(366004)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(55016003)(26005)(107886003)(9686003)(38070700009)(86362001)(33656002)(122000001)(38100700002)(52536014)(2906002)(5660300002)(83380400001)(71200400001)(478600001)(7696005)(6506007)(4326008)(8676002)(8936002)(6916009)(66946007)(54906003)(66476007)(66446008)(316002)(66556008)(64756008)(41300700001)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?jvqXhklHL4CgD+9RtZ5YXjoHRBxazTyraKLI1ENqmpy2snclhZmUvSEaYgLQ?=
 =?us-ascii?Q?ZkWY2kKlLrxjl31FcAr2T5y1pJ2gPLx/oCGsJsGnOmwzsaWjKKMkKhv++z18?=
 =?us-ascii?Q?aPHO3+NsyKMoxhJd3deDgeS0JWCK1C37ab/NxZAjkZafeAYvLe10iXpzCL9c?=
 =?us-ascii?Q?cgcSG4nBNCu2AZdE0F5jQ0OUIIk+A4zcDYZiUuHd6PGooZKuKkYzXD1CpMla?=
 =?us-ascii?Q?UAYIfma8Loj+Y1ABhACGMSkm9yqtLiWAEKBKJg9LMTAX0cXgBGE84tQoxRZk?=
 =?us-ascii?Q?I0P3LigWADjgbl39jUUrn2g6dUwQTvDwmkJDVw9g+iHG7vGyrfOqBhUVOFbG?=
 =?us-ascii?Q?dygxe1smvmYfhuVECcFDljY2MwKaVTjHxhv7FufVplhdtB+stviG2Eu3Jsb9?=
 =?us-ascii?Q?SYu2IZWMJ0nhJmEy8DRyxW7h1z1YJpPoIQz/XyCtNTSFxvu6MbnUvp2R1Asg?=
 =?us-ascii?Q?qDszmRIUOei6XBO6jEnGW5FudOPRlyfQcyQ2mP4cduj758nuqVaH9x3p2njm?=
 =?us-ascii?Q?+Fv4LM8Z7saMev+nkwePZr7d6WZegWm3ZCU8TsdgFUv/HaMrYCBEO28eIfZS?=
 =?us-ascii?Q?aNp7BBxG/L8af89hGtnLEHCeNdTmKDRPSztgQXKXSTS3ahu690hpKhYdiC/w?=
 =?us-ascii?Q?1AX/UIb4+fXVYH0HcCIeMi8xD8yzWmY0IknmGAOg093ykJFB4TtFTfrpeYoj?=
 =?us-ascii?Q?CdnrNUZKUoGRiefgwnw0ra9R1ZB8cZjnq15KpD7J7n3K2IYMWzrOF61LcMt1?=
 =?us-ascii?Q?825FxlmOUfhDeXn+mgHTd36Yi/4L2c1+0kEHjg3XCXpqKBKBPGe0VKUDo5eI?=
 =?us-ascii?Q?j24978y/Rt0cjHunNGGfNSkV+1sKz1q2kLF8jGgr4T+SO1D2Cw+sc5tone3J?=
 =?us-ascii?Q?lCSoD7ZulIogc2Lp5KYG+ush0kTFXb8Ix9PpU5wyqQ4b/dLwOlltzPRZgvS8?=
 =?us-ascii?Q?RYWdgfHkISwvPEySDtWToFaQgy31bBiOiiwNf8GQfJhOg7wITwjGUZNK0xvS?=
 =?us-ascii?Q?zN85Itw4Je1eChuG9XTCTrtTFQ9SEfQCy909gFoE3XsT5tU/lQeFz2J0iuqA?=
 =?us-ascii?Q?SkY5d66Vx8iuB5ce94zqFJMGjSiP41RKknBWCM7cY0Sr7W5lsxIVjhSqyomY?=
 =?us-ascii?Q?NN10OsQIQRlTFQNk4p/KHPh/kEelwEtVe2yBWGm/gSs4cFHQ4gm2Z0nOWkal?=
 =?us-ascii?Q?vw49aKU1f6VSnSFcaJlTQxIQ8YvLHqQF3mxS6UmUZcoVkdHzck2p19AYGLCY?=
 =?us-ascii?Q?460mGgZL8bRuz4vcjqt3DjjT17DuPR6jtD209p0o02rs5WgFo9iXIE3sWK5q?=
 =?us-ascii?Q?x6NyY7NHUrxMB/kMjOfzX9GyaPT9UQSypw17Ilnq84rxR+YDE7eYUEeCZ03b?=
 =?us-ascii?Q?gzMjtTisLK76zWn10J1eazD+gIT9jGsb5H0VGRGS8Tcpy80/Ieeda0M4vYYg?=
 =?us-ascii?Q?rHuE1qKlF1L/5iyjY8fCgkWzA/5BR35Ep2XbgCDl4whGEtL5niISkfJLYiiQ?=
 =?us-ascii?Q?RkGa00fUldNDPilCBqupWu5yUXCg87OaugTT3w4XhGvtUgOb/q1x+SeeCBKa?=
 =?us-ascii?Q?Hx5Abt94v9RDepI0ksg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73d6775d-da8b-4bfd-fe89-08dbdac4cb7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2023 10:24:56.5135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lKe+tbaV8ZhM6+E5B335zroTUbljCWQNYzHasCLZdjK2P24XhS+uGjxICCAcaY/2elJrYXLvXHy+NgGQw7EL4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6211
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Wednesday, November 1, 2023 2:06 PM

> My experience shows we need simple composable and self-contained blocks.
> If we are trying to make hypervisor avoid accessing device memory (which
> seems to be one of key design points behind what you are building) then w=
e
> can't have queue msix vector index migrated in one way and the vector its=
elf in
> a completely different way.
>=20
Make sense to include as long as one can use it.

> For example, one of the advantages of using admin commands is that they a=
re
> atomic - so we get a consistent snapshot of the device state.
> But, this goes out of the window if we are referencing a table that is no=
t part of
> that same command output.

To make the device active at destination, one needs both the fields restore=
d as consistent.
Only after that one can make the mode change from stop->active.
Usually, vq is indexing in the table without reading the table content, rig=
ht?
I can see some device implementation may try to read this table when writin=
g the device context,=20
but that would be really hard for device to keep synchronizing VQ with msix=
 entry as in theory vector can be masked.

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

