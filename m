Return-Path: <virtio-comment-return-8210-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30234C4332F
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 11:21:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 89BAB774ED
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 11:21:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6C86898672A
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 11:21:15 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4FB7098671A; Mon,  6 Nov 2023 11:21:15 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3F90B98671B
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Nov 2023 11:21:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HoPxty8+hTzQ8EjC8YKVJ85nGhHbpZsc0HpPFX/qXnuZLI4IE17QtPvLGex2egyEQa00vX6LEd4Y//8RTXwSG2G8YimCLjS1l3MMcdfhj3nEMQjVI1tR8rAkLQBUIjiZ36WzvyxwLo+BY9BjWoPO+BgzxgLIUjiOT9H3UUvsh280yZYwDf52JS/kfx2jzKQ/+iWHzKn/RUwjgr264aE5qj+wOXn3BWG7aK3Mz24YyrnqFXaRLNVFU+NF7ZnCUNkwHgFKiEMmXnUrjbFpFZv/YRSS/2dJ0aa1RRbIV04MCuuwZBCCXwd3YxxcKykcWii759F/f56JO6u6zHoDgqP5gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fahwcqOmbIM82e14VfGhNZsGur+Vk4f4nQu6AIiyl2A=;
 b=B3gl87kwsA0dlz/EfEycaLLxFuID0jrHpYB8gN4NZhIHVi9uLylVp0pt8bdSOy+lC5DoWVgZ/EEN76iH8XGU6nNIuPbKACYEKni3+AJjlymb8KFQsCnCjYcfgNXyUXiqvXwDLCP1Zz+dsXZALi37PuceCKV9m4LlIHrCIsLjTM63ifDOytL7zKCd0k701xPYmo3eiOgflCjF3CivB2yocQcJWuGTRXbzjLNiuqGbB4Jh027X1qbkf5GXc9JMrZwIo6rZn8m6nOf9xRgvLcDlI0huKtKjJjsc+RgK08d4FVKJFmBJRPasbG2qg9nJ1FkPJ4QhdF21PfRBHLJQTiK/8Q==
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
 AQHaDkFr7w3tkrCqqkSwyxm5dwAptLBoapSAgAABpXCAAETRAIAACO2QgAPyz4CAAAX1wIAAaQ+AgAAN5TA=
Date: Mon, 6 Nov 2023 11:21:12 +0000
Message-ID:
 <PH0PR12MB54811E4E56B40A661878D8D7DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064730-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D028E63E6CB0AA7F4149DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fdfda658-e89c-41f4-9f4c-77d5d9b1b642@intel.com>
 <PH0PR12MB54818179419B06412D7A9C84DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <445ff573-72c3-4fe4-9e07-e7fdd2dc5750@intel.com>
 <PH0PR12MB54818BAE4BD33983E6108FE5DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231106052340-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231106052340-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS7PR12MB6192:EE_
x-ms-office365-filtering-correlation-id: 3b0b3186-ff56-4b07-c0d5-08dbdeba7b8c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 qgNxj6n7jjESlxXgzOhkY/8Ujt3EOZFNjGuD1j33+rnJ/WR+O6g4edKoBCzgqrWRfaOrEZ9CulDt1kRgZ06qcYIdIywAg0t3Hn5VjUpEuy7uJ4EMOfPi5yHEZAcN4LH7EhsnO1CzohaOpAT2FQBfEhNMMGc+UqpjijOcugni6qFqe4J2e8k8lYn5daB8gbDHgdM1ciL6VOtVEKIgHWAkux1NVM3HRHPuat5Csp3nJj/T7FnFy6ef5U0dPja+5yIH2s+n3h4Sh5RglHyJnAXfDCGGsbdT2DTPDpcPoJsMimHrlFzbVzmRL6UW7sxCDj8e6VKBeMj/bI3s/ayqWy9xgqpaWusn+1MZjPHepfdn7kN62COkgWUXtPE7uZgIm92e0NmdzpYpdsU7ICEiONgSQv4BDtYb4uN0zUSLcvshplJxCvhmF4UwFbCj3DM7U/a98KtnYovP6QMg3rVvnH+R0eiqe3lMmqEIS/66MWAII1nEYGa1H+NGWKmlGJaaI86ZmLqJmFffvI2a/wWKqyo+iFst+PWrLj//8Ui+EWEFhwUGqENuN6FbTuommHdsOwlG4+JJMfi1udifxklEgSGtwTcMGM/h6ogXyjsuLTvMNZP5ep/8gSVdr4uYueyj/3Yd5RLhQxq3YI7wGsd+jDhQvw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39860400002)(346002)(136003)(396003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(55016003)(38100700002)(7696005)(71200400001)(6506007)(83380400001)(9686003)(122000001)(86362001)(33656002)(41300700001)(4744005)(2906002)(8936002)(8676002)(4326008)(5660300002)(52536014)(64756008)(54906003)(66446008)(6916009)(66476007)(66556008)(316002)(76116006)(66946007)(26005)(478600001)(38070700009)(14143004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?rkBd/+kD+O4XStgfEWRz1JxReQgXDkwXfqvs/4JcJ70srkufhijQLlO4CEIc?=
 =?us-ascii?Q?N7vVpWIQygYCeLrO47tCKaUftlyoKbEEFEJIqhIWmAB7f+6oMrN5kJJ6e8uc?=
 =?us-ascii?Q?/bgpXEkHuZW1JKQUXxaXtjyiVIqrtI7JzPIbXWPpz4TJLqDDOLPnbBpdwhEW?=
 =?us-ascii?Q?uJp9TUuSXTytdvFStJvxOFvGt4+e3Ia0TaaIiDNkUvh5aUOJXFfWr0Z/LfuG?=
 =?us-ascii?Q?ohWLTqcstLugi3D0BHc21pBf5SLvulFAMVON9ozwUXdTI1by/Z2ATco+Xaff?=
 =?us-ascii?Q?T+iIgdW/mBLhm71IRZ0qiZKJABpU02bftO1WNzsZ4iTmaYa8UQuOBSbVlqRY?=
 =?us-ascii?Q?ksB01GJc9A8cdltOVchQ9U28+zzBudDowpa7h1T808WtZYpNg2WJslx2DrNb?=
 =?us-ascii?Q?tGhzQHM/1UKId62/iEfBh9sGnBLwgbxcZmkwVXIKp67D1rW0kJzVuBb8ZMRk?=
 =?us-ascii?Q?vEeczJVoWqqug95nI75QJX0axTEMZmZQuSULD+PrUmR9j4xU5TGFqhDgbGbn?=
 =?us-ascii?Q?1cxWCwhJXmUeijKZ/IQEBs5JQto0oV7x/Lx71Y/gfy6RKCCG41Z5ql6zWDQM?=
 =?us-ascii?Q?sq7/yfUlxWoJ1lZ+NwBjYdy3kJDkPsdMElPDJ7KGYEyAFEjW/tgNRA0Zl6Mo?=
 =?us-ascii?Q?8Aeryi3Aks/V2DR/AlcJ/LE1E40Wm07unFRI3WRlNGIQstSLFPSR69Ct7PpX?=
 =?us-ascii?Q?bxF94u7mawWnvAdbo54gSs0DorYoC1aQDBSuEoRTl2IV5/V2EaLZGRnPDf1m?=
 =?us-ascii?Q?6jtadRBAn+LqMPmWsj6MLbw3LXyKngPFurpCHywgpm2owL9H09A7NAmPzaI6?=
 =?us-ascii?Q?uBZnJHLBop1uWDgajmfe57cVg4QV1ndje+JiEvbbTz9RQhxd2XbpAr65nPZA?=
 =?us-ascii?Q?UdHJpoZEc9j2uOJb0yB0z7BZyUM+QkPRytLFvZ7fzU/MtNgNy4CvQLJVa8yM?=
 =?us-ascii?Q?2H1mC9I9l5hnc6zc+GrL+w4lZaqcT447HYk8YhxuvToL8eo1davOr5awi0mp?=
 =?us-ascii?Q?sg/Kf5tpK2ndvqYEpT8y/zXIjR1r8K9f0LMw8EvxG2+b+lgsVfTLbKvIqjRN?=
 =?us-ascii?Q?QssIP2vMNStV9LhC+NfkBEQj+AqV3x7DqExj38gKDhAJ0jXAwSZTagvg+W/A?=
 =?us-ascii?Q?+5paSS2dd487i6AzhA/I2aMjDLvP/yVfuGuh/llpRuFyNDddl9OgMnh8szA0?=
 =?us-ascii?Q?h8t3n/6Dfs5e1LW5N74yUWmcVL/3uY6hGreMM9dwjblxe886wlq5pZaLjysd?=
 =?us-ascii?Q?vy8WpFdlNVWdU/6m3KQFsjxtKqjZ1SlIsh8Vcnjc8sYtU4XJLptWY2c+ENdp?=
 =?us-ascii?Q?ZnJOed0CzzDkDhMdRrg43rtnxcxGe4I10XtA9Rt1Kk//dVAX3BDHkUhVyg8+?=
 =?us-ascii?Q?f+vU/bl1kCgksDZOCOLpW6Z8IjLIB4SO73N+Xr9Q1RB4WYdaJS3tJyDd7M60?=
 =?us-ascii?Q?IGcnPADUEoXdK5Dx87ajH3Nkeo7REOxtuhew8d+xhZ8lUBYpKqgUshgSk57w?=
 =?us-ascii?Q?xVYh/yCJfM+Uk98azJH582JdDCxQnpa5j7Gs79yDfKWWSA/NcVUzniWgNR73?=
 =?us-ascii?Q?7KX445eJV7Zqb29r7fw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b0b3186-ff56-4b07-c0d5-08dbdeba7b8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2023 11:21:12.0758
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7oAAoR07IphA7TuLI4WSR/fc6FtWnr1CdhOowhOPU0IERHs/PwvdHt6JgLKs/JNdxNjgp4COPX4zCWrTbF2O7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6192
Subject: [virtio-comment] RE: [PATCH V2 6/6] virtio-pci: implement dirty page tracking


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Monday, November 6, 2023 4:00 PM
>=20
> On Mon, Nov 06, 2023 at 04:34:44AM +0000, Parav Pandit wrote:
> > > Do you know there are locked transaction and atomic operations in PCI=
???
> > Can you explain how PCI does RMW locked transaction?
> > Is it one TLP or multiple?
>=20
> Parav what are you asking about here?=20

> pcie supports CAS and Swap which likely
> can work for this use-case - these are non posted writes. It's in the pci=
e spec.
PCI spec do not have atomic OR operation.
Lingshan in above comment suggested some unknown locked transaction and ato=
mic operation.
So I was asking him which is that atomic operation and how PCI does it?
I don't know if any that can do PCI atomic OR without a workaround.

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

