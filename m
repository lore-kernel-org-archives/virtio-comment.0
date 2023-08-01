Return-Path: <virtio-comment-return-6938-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8838FEB64DD
	for <virtio-comment@archiver.kernel.org>; Tue,  1 Aug 2023 07:09:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C5EFD2B12F
	for <virtio-comment@archiver.kernel.org>; Tue,  1 Aug 2023 07:09:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B8A29986478
	for <virtio-comment@archiver.kernel.org>; Tue,  1 Aug 2023 07:09:17 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A57939843C7; Tue,  1 Aug 2023 07:09:17 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 903FF986408;
	Tue,  1 Aug 2023 07:09:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MAEeafsLSjPxyWqN3pnRfDcvk0qF74XRrfDnaDSP11+s+Qx1zZ4UrUmgS4r6DyxSXcURub95K7T+xGeSGDSqeqMqCr4BncgQu3s5ZxriDjjkVlreUm+275Nx/YGYRaMdrx4L0Ty7SLvN0IeAuXuQr0z4edRJyT/M/OOYmd9/CM8UgvYPOoozdvW1/0hJB0RGa+itv+4xchcDz9ITlTN9JX1DrFxK9O1rD5jczs7K9yTsonxuJWgwz8PR7sO8JwG3tyoLxMGBN9oCqwqAQIYIH+A/O1maI9GLfK9/a8YqvtGlhqvWPOzadYbzcHq0DSLkkJ88m+d4mK1AHfHIucnhlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6lPIf6VpokMmezrSiItKnfMbTKxxYs51PBw6yOGuKfE=;
 b=O0eE2k9IOs/YVquECURvdr9mYFZ0/wJqKhMuREHaDx7KKjngACMKJTcvJdILiRrFetUBUwQ96aiuOZeyxlHoxOLonFNZ9rl2x4b83uSffdF076Go5XiJLzu6SgbDxKJZKUib2JFifOj8RsRh2abdQHUOpkS1U+ko1Ti9GVAKUJEjePeaZnYI9DozvOrZJPL7nNUX85pZgP9eEMKXBJZz8z9m7UiU1UHsZ4GWnTSq4dOoB1fkHHb+bpVhCDgBNDIdRUJGe5u93sqsNEf7Ym58Ug6Q2mfnxtLBibFnONMvoD2x4AKAlpssM9cOmd1U27RWPt8StnxjS9GOc2ylCl7TwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
CC: Shahaf Shuler <shahafs@nvidia.com>, Xuan Zhuo
	<xuanzhuo@linux.alibaba.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>
Thread-Topic: proposal: use admin command (and aq) of the device to query
 config space
Thread-Index: AdnERrUyzvIBkM4LRwukraLndwiuSg==
Date: Tue, 1 Aug 2023 07:09:14 +0000
Message-ID:
 <PH0PR12MB54818D33A150A01DACF3BF74DC0AA@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SJ0PR12MB6879:EE_
x-ms-office365-filtering-correlation-id: 795bdf2e-a7b7-41dc-8a56-08db925e36bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 /QaBdlkLN/bLgFnEuM9xktKe5ZLkfDmoEthA+sMaqGLLbhtMPXnK+4Jdwx7uQdSAi0X4AZFO0+qra4Ijn+sifDV0CM5ZlEXKTC8KV1CVA8/IC7Xp9N4IBLJMXg2XS8cpj4gVQdAhgkC6TwMenOi4c47+LAiLiqXK4+4asYo2EuZaeTE92tJDCqVGtkv8U2hiNBMNtOmxnxIlgFCtSR8SI/ox+bs5JeG5EyMjusWG67q39GsFAP0rOhq2PghrEWbQRsSOAKBC0HHeCbknoqA2NFc0avWz6r+t2uuMXd03b84PsxLLoAiivzoKQoFUKcGw1aaK6RRBM4qQCnj/F7zIGllu2QMndwILh48XZ7paMReMig2p5OEdtcmLBWq6t9hmZ7L5pjHLKFszsEWmglG8QA8KvydgkLxc9EUZblpHDwRk5C1NwN72noA3W9BpCHs00Rt6Fs9KTWenjP7w39WWjfT8WRc/hd9g4KKmgTssanWhymsCtw5n2nCRBr4zz3lgfTzQe18n+wXV/TkXeeA9Gj0bdbxlcvt5mqCqh+rL0glD9AkPUOQY0qlMN14tQWaXGP86XV8MAn1COR27FUSN7SNj5Kylfr29n4sUW9gSf2xl7ny03yQUYGuXLrD/mw4l
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(366004)(376002)(451199021)(4326008)(64756008)(66556008)(41300700001)(8676002)(66946007)(8936002)(76116006)(5660300002)(122000001)(52536014)(54906003)(110136005)(478600001)(316002)(66446008)(66476007)(2906002)(9686003)(86362001)(71200400001)(7696005)(38070700005)(38100700002)(83380400001)(6506007)(26005)(33656002)(55016003)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?3VApIo9cAY+FUC7xaP4thrA5G1V9c0765rEn+6URkxsEePytsJrv2oTaSdsw?=
 =?us-ascii?Q?4oGIoCoG46TuVUCEXa1qlluYQI2JtNrKT8HI8ZZcUp6yzM9eAzAWBS/4ZwWj?=
 =?us-ascii?Q?OI44caLUTQmDCPk6XXlgOW1b/K9PReCrWBUqt+JipdRPoyrtFMN8ffuiZH0H?=
 =?us-ascii?Q?mIvIDRelKIkNpCcELQTHCuuI9rJBQ/CjAfIKlP9fDFVbATqJjZSTExMr+HWs?=
 =?us-ascii?Q?kkAC+0BTWdOtG49NkkIwLWMOu0dQKl5/4BZKQiYPTWlxrpTCgRplw9fHzeI4?=
 =?us-ascii?Q?Xb4+IFQRnm3A+c8p15NQmkCUVZq3vvMkoGkmqfvYFrPudai1ZyjFQB6LpK5B?=
 =?us-ascii?Q?K6rvvTykGoM1Z5l0X5ZEXiCiBu7TZ2Kxz2cpG/wDPDwDyCMA4XnP7W/t5MMS?=
 =?us-ascii?Q?9eWhzV8aYS4khFbdhxIoCnwqOuDRalIP1CQALELlMgdq00dRd6k0ioEjwhX7?=
 =?us-ascii?Q?+a02oqPDkYdcWwc3V7lK7vt5T+Qkn4lQae1nugI+8M2M7bSqmT5sb7CoJ6GX?=
 =?us-ascii?Q?NnsXkHlWZ0doPuqXQdcXArKJFa3xTNy//yWjLtyqvD1sAIIzJpdyBUvkWnjS?=
 =?us-ascii?Q?gYrdF9Pd7q7U/r9t5DAAZdwdCJanvBvjtzf9m6DwMqlcreiW/rBk2uDSn5ga?=
 =?us-ascii?Q?Xz0SsQoWWVBCvXFA4o6zQViAlZhoTI4RPTY7Wquv73vsF8K033ptqGFIMY8X?=
 =?us-ascii?Q?dE70Wze62K8Ei4SLNrOOq5dL3Q56gpZYjdJQgoirA2WmEwUpdxI3dFSaL3BM?=
 =?us-ascii?Q?Ls+J83byRKY7xi1Sf+zk2lCLjoh3bv68+HrAWu90du7vJhL5v5H7kAc2HxKd?=
 =?us-ascii?Q?Ts2g7dUbo8V/Yer752jbsR2uJZUiZwOMFF1OxArQErFUjS+JcIBYnd6NxY9P?=
 =?us-ascii?Q?qMpvM2PxzOZKkeYyL40Dd8NedWVbxVxDTxeVIADhyeaAEb/hMPE558UJXD7m?=
 =?us-ascii?Q?wQtfSn8+FBTnTCYqRk6VrkMwJ600fGy/qYiQk0NDb99USeM7KtkFOaRH/nJ+?=
 =?us-ascii?Q?FK9uS2vAZQyCiBPD1rjr0D13EgLhOOZ8C6P/fgm0EsJ+EQ1ODxUMW7RZcRmF?=
 =?us-ascii?Q?/sQ9Xg+cF3yawsd1A3EmOtlNKVNcx/k98El406MZ+/8wz5hqgMMpabuzBi3+?=
 =?us-ascii?Q?h37zMzit9uVYV8t4ryqaBJYSYzCRe3bbOUsoKcYO6l9Z2eUnwwYA/K2WXx8i?=
 =?us-ascii?Q?D2qnWItWnQ2uY9R/deIOLidAeYr/vRjaxLy3fc3MV9Wx0KNOO5YoW5SsQeR9?=
 =?us-ascii?Q?ItkQJMRjslPkcAN1PWKK3kXSTeUFK77IgUc0wUBQTmJDwYnYIowzg1+fmCmd?=
 =?us-ascii?Q?3vYrIK5XiyubIgaNB4eqNYJleu46PVBOMW6gdWgujWJ+NaUzZd6ZV+4RHBaJ?=
 =?us-ascii?Q?1z6fVzggmCQgP5yHNG3EW99b5vMd10CeBmykc3uCdY6+5y3nsUROPPCCx1M3?=
 =?us-ascii?Q?CiIm7lB5b/uOuU/0oDCZ3MCHWypSfHbZHUXjWXyVX3E24F8/f2WletfJcPRY?=
 =?us-ascii?Q?seWEVTQVYneYPYDVc5c2BgDr+S4oLl3+PRqXNB70a6AfIrC1IoG9jSgJ3mz+?=
 =?us-ascii?Q?E02rg/UDHO3Yx1cmif8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 795bdf2e-a7b7-41dc-8a56-08db925e36bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 07:09:14.5873
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X/FeXbZSNNts7eDYmTHCJSB+F5sbs83idTkXEsBZQ5UXg+2R2Svu/jyQLM+pPzA6pHDDAjb0q8M5vDcbTKxSfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6879
Subject: [virtio-comment] proposal: use admin command (and aq) of the device to query config
 space

One line proposal:=20
Let's use new admin command and admin q for all device types to query devic=
e config space for new fields. (always).

Details below.

Query of device capabilities and configuration using DMA interface.
Need:=20
Currently device configuration space is exposed as read only registers. It =
is growing rapidly.
Some devices may be even multi-functionality device in coming future such a=
s net + clock + rdma device.
For a PCI transport implementing such ever-growing capabilities, configurat=
ion is burdensome as plain registers.
Hence, it is required for the driver to query capabilities and configuratio=
n using a DMA interface.

Interface requirements:
1. Maintain backward compatibility for existing defined configuration field=
s to stay as registers.
2. Any new field added must be accessed via DMA interface, regardless of de=
vice implementation (hw/sw etc).
Results in single driver code regardless of device implementation.
3. A device must be able to choose, starting from which field driver must q=
uery=20
such configuration via DMA interface. This field offset must be greater tha=
n currently defined configuration field.
4. Any driver to device query operation must not be mandated to be
mediated by the owner device for PCI VFs or SIOV or SF devices. Driver must=
 be able to
communicate query capabilities and configuration fields directly to
the device regardless of device type being PCI PF, VF, SF/SIOV device unifo=
rmly.
5. When having multi-functionality device in future, it is desired to not a=
lways
query all the configuration but may be able to query per-functionality conf=
igurations.
For example, query only steering capabilities, query only rdma capabilities=
 or query only clock capabilities.
6. The driver should be able to query config/capabilities without
polling for the DMA completion, in other words, the driver should be able t=
o get
notification from the device when DMA command completes.
7. The driver should be able to utilize existing interrupt vector and/or
virtqueue for query and set operation without demanding
additional interrupt vector whenever possible.

There are multiple options for DMA interface.
Some of these options are listed below that we would like to consider fulfi=
lling above requirements.

Option_1:
New DMA interface registers.
New registers which allows single outstanding DMA command per device.
Such as,
struct pci_dma_cmd_mmio_registers {
	le64 cmd_addr; /* rw */
	le32 cmd_len;	/* rw: ordered write to it after cmd_addr, this triggers cmd=
 to device */
	le32 start_offset_cfg_space; /* fields below this offset are not available=
 as register, dma is must */
};

struct pci_config_access_cmd {
	u8 opcode; /* 0 =3D get config, 1 to N set dev specific config */
	u8 reserved;
	le16 msix_vector_index;
	le64 rsp_addr; /* points to struct pci_config_access_rsp */
	le32 rsp_len;
};
struct pci_config_access_rsp {
	u8 status;
	u8 debug_field;
	u8 cmd_specific_data[];
};

Cons:
1. Duplication of a VQ interface which can do same work and vq is purposed =
for "bulk data transfer" in spec already like this use case.
2. Some devices already have CVQ that can easily fulfil this role, which is=
 not utilized.
3. Requires per device additional 16 bytes of register space.
4. Requires an extra msix interrupt vector to differentiate from config cha=
nge interrupts.

Option_2:
Use admin vq for all the device types regardless of its transport such as P=
CI PF, PCI VF, PCI SIOV.
In this method a new admin command is issued on the admin vq of the device =
itself.
Pros:
1. Requirements 1 to 7 are fulfilled.
2. Driver can reuse the same vector with CVQ that addresses requirement #7.
Cons:
1. Requires per device unique admin queue number and count.
Still better than dedicated dma interface of #1, as it requires only 4 addi=
tional bytes as opposed to 12 bytes.

Option_3:
Use control VQ for the devices that already has CVQ.
In this method an existing CVQ of the device is used to query device config=
 space.
Pros:
1. All 7 requirements are fulfilled.
2. Does not need 4 bytes of admin queue registers.
3. Save MSI-X vectors of the AQ.
4. Superior to option_2 as it doesn't require extra AQ.
5. Most efficient of all 3 options.
Cons:
1. Those devices which does not have CVQ, may need to add it if at all they=
 are growing.

d. Any other option?

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

